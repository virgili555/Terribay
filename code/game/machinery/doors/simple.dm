/obj/machinery/door/unpowered/simple
	name = "door"
	icon = 'icons/obj/doors/material_doors.dmi'
	icon_state = "metal"

	var/material/material
	var/icon_base
	hitsound = 'sound/weapons/genhit.ogg'
	var/locktype = 0 // 0 = none, 1 = high noble, 2 = lownoble, 3 = city watch, 4 = inquisition
	var/is_locked = 1
	var/datum/lock/lock
	var/initial_lock_value //for mapping purposes. Basically if this value is set, it sets the lock to this value.


/obj/machinery/door/unpowered/simple/fire_act(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	TemperatureAct(exposed_temperature)

/obj/machinery/door/unpowered/simple/proc/TemperatureAct(temperature)
	take_damage(100*material.combustion_effect(get_turf(src),temperature, 0.3))

/obj/machinery/door/unpowered/simple/New(var/newloc, var/material_name, var/locked)
	..()
	if(!material_name)
		material_name = DEFAULT_WALL_MATERIAL
	material = get_material_by_name(material_name)
	if(!material)
		qdel(src)
		return
	maxhealth = max(100, material.integrity*10)
	health = maxhealth
	if(!icon_base)
		icon_base = material.door_icon_base
	hitsound = material.hitsound
	name = "[material.display_name] door"
	color = material.icon_colour
	if(initial_lock_value)
		locked = initial_lock_value
	if(locked)
		lock = new(src,locked)

	if(material.opacity < 0.5)
		glass = 1
		set_opacity(0)
	else
		set_opacity(1)
	update_icon()

/obj/machinery/door/unpowered/simple/requiresID()
	return 0

/obj/machinery/door/unpowered/simple/get_material()
	return material

/obj/machinery/door/unpowered/simple/get_material_name()
	return material.name

/obj/machinery/door/unpowered/simple/bullet_act(var/obj/item/projectile/Proj)
	var/damage = Proj.get_structure_damage()
	if(damage)
		//cap projectile damage so that there's still a minimum number of hits required to break the door
		take_damage(min(damage, 100))

/obj/machinery/door/unpowered/simple/update_icon()
	if(density)
		icon_state = "[icon_base]"
	else
		icon_state = "[icon_base]open"
	return

/obj/machinery/door/unpowered/simple/do_animate(animation)
	switch(animation)
		if("opening")
			flick("[icon_base]opening", src)
		if("closing")
			flick("[icon_base]closing", src)
	return

/obj/machinery/door/unpowered/simple/inoperable(var/additional_flags = 0)
	return (stat & (BROKEN|additional_flags))

/obj/machinery/door/unpowered/simple/close(var/forced = 0)
	if(!can_close(forced))
		return
	playsound(src.loc, material.dooropen_noise, 100, 1)
	..()

/obj/machinery/door/unpowered/simple/open(var/forced = 0)
	if(!can_open(forced))
		return
	playsound(src.loc, material.dooropen_noise, 100, 1)
	..()

/obj/machinery/door/unpowered/simple/set_broken()
	..()
	deconstruct(null)

/obj/machinery/door/unpowered/simple/deconstruct(mob/user, moved = FALSE)
	material.place_dismantled_product(get_turf(src))
	qdel(src)

/obj/machinery/door/unpowered/simple/attack_ai(mob/user as mob) //those aren't machinery, they're just big fucking slabs of a mineral
	if(isAI(user)) //so the AI can't open it
		return
	else if(isrobot(user)) //but cyborgs can
		if(Adjacent(user)) //not remotely though
			return attack_hand(user)

/obj/machinery/door/unpowered/simple/ex_act(severity)
	switch(severity)
		if(1.0)
			set_broken()
		if(2.0)
			if(prob(25))
				set_broken()
			else
				take_damage(300)
		if(3.0)
			if(prob(20))
				take_damage(150)


/obj/machinery/door/unpowered/simple/attackby(obj/item/I as obj, mob/user as mob)
	src.add_fingerprint(user)

	if(locktype != 0 && istype(I, /obj/item/weapon/door_key))
		var/locktoggle = 0
		if(locktype == 1)
			if(istype(I, /obj/item/weapon/door_key/highnoble))
				locktoggle = 1
		if(locktype == 2)
			if(istype(I, /obj/item/weapon/door_key/lownoble))
				locktoggle = 1
		if(locktype == 3)
			if(istype(I, /obj/item/weapon/door_key/citywatch))
				locktoggle = 1

		if(locktoggle == 0)
			to_chat(user, "<span class='warning'>\The [I] does not fit in the lock!</span>")
			return
		else
			is_locked = !is_locked
			var/locktext = (is_locked == 1) ? "locked" : "unlocked"
			to_chat(user, "<span class='notice'>You have [locktext] \the [src].</span>")
			return

	if(istype(I, /obj/item/stack/material) && I.get_material_name() == src.get_material_name())
		if(stat & BROKEN)
			to_chat(user, "<span class='notice'>It looks like \the [src] is pretty busted. It's going to need more than just patching up now.</span>")
			return
		if(health >= maxhealth)
			to_chat(user, "<span class='notice'>Nothing to fix!</span>")
			return
		if(!density)
			to_chat(user, "<span class='warning'>\The [src] must be closed before you can repair it.</span>")
			return

		//figure out how much metal we need
		var/obj/item/stack/stack = I
		var/amount_needed = ceil((maxhealth - health)/DOOR_REPAIR_AMOUNT)
		var/used = min(amount_needed,stack.amount)
		if (used)
			to_chat(user, "<span class='notice'>You fit [used] [stack.singular_name]\s to damaged and broken parts on \the [src].</span>")
			stack.use(used)
			health = between(health, health + used*DOOR_REPAIR_AMOUNT, maxhealth)
		return

	//psa to whoever coded this, there are plenty of objects that need to call attack() on doors without bludgeoning them.
	if(src.density && istype(I, /obj/item/weapon) && user.a_intent == I_HURT && !istype(I, /obj/item/weapon/key))
		var/obj/item/weapon/W = I
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		if(W.damtype == BRUTE || W.damtype == BURN)
			user.do_attack_animation(src)
			if(W.force < min_force)
				user.visible_message("<span class='danger'>\The [user] hits \the [src] with \the [W] with no visible effect.</span>")
			else
				user.visible_message("<span class='danger'>\The [user] forcefully strikes \the [src] with \the [W]!</span>")
				playsound(src.loc, hitsound, 100, 1)
				take_damage(W.force)
		return

	if(src.operating) return

	if(locktype != 0 && is_locked)
		to_chat(user, "\The [src] is locked!")

	if(operable())
		if(src.density)
			open()
		else
			close()
		return

	return

/obj/machinery/door/unpowered/simple/examine(mob/user)
	. = ..()
	if(locktype != 0)
		to_chat(user, "<span class='notice'>It appears to have a lock.</span>")
	if(locktype != 0 && locked == 1)
		var/locktext = (is_locked == 1) ? "locked" : "unlocked"
		to_chat(user, "<span class='notice'>It's [locktext]</span>")

/obj/machinery/door/unpowered/simple/can_open()
	if(!..() || (locktype != 0 && is_locked == 1))
		return 0
	return 1

/obj/machinery/door/unpowered/simple/Destroy()
	qdel(lock)
	lock = null
	..()

/obj/machinery/door/unpowered/simple/iron/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "iron", complexity)

/obj/machinery/door/unpowered/simple/iron/highnoble/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "iron", complexity)
	is_locked = 1
	locktype = 1

/obj/machinery/door/unpowered/simple/iron/lownoble/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "iron", complexity)
	is_locked = 1
	locktype = 2

/obj/machinery/door/unpowered/simple/iron/citywatch/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "iron", complexity)
	is_locked = 1
	locktype = 3

/obj/machinery/door/unpowered/simple/silver/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "silver", complexity)

/obj/machinery/door/unpowered/simple/gold/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "gold", complexity)

/obj/machinery/door/unpowered/simple/uranium/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "uranium", complexity)

/obj/machinery/door/unpowered/simple/sandstone/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "sandstone", complexity)

/obj/machinery/door/unpowered/simple/diamond/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "diamond", complexity)

/obj/machinery/door/unpowered/simple/wood
	icon_state = "wood"
	color = "#824B28"

/obj/machinery/door/unpowered/simple/wood/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "wood", complexity)

/obj/machinery/door/unpowered/simple/wood/saloon
	icon_base = "saloon"
	autoclose = 1
	normalspeed = 0

/obj/machinery/door/unpowered/simple/wood/saloon/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "wood", complexity)
	glass = 1
	set_opacity(0)

/obj/machinery/door/unpowered/simple/resin/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "resin", complexity)

/obj/machinery/door/unpowered/simple/cult/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "cult", complexity)
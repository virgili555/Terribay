//Sound environment defines. Reverb preset for sounds played in an area, see sound datum reference for more.
#define GENERIC 0
#define PADDED_CELL 1
#define ROOM 2
#define BATHROOM 3
#define LIVINGROOM 4
#define STONEROOM 5
#define AUDITORIUM 6
#define CONCERT_HALL 7
#define CAVE 8
#define ARENA 9
#define HANGAR 10
#define CARPETED_HALLWAY 11
#define HALLWAY 12
#define STONE_CORRIDOR 13
#define ALLEY 14
#define FOREST 15
#define CITY 16
#define MOUNTAINS 17
#define QUARRY 18
#define PLAIN 19
#define PARKING_LOT 20
#define SEWER_PIPE 21
#define UNDERWATER 22
#define DRUGGED 23
#define DIZZY 24
#define PSYCHOTIC 25

#define STANDARD_STATION STONEROOM
#define LARGE_ENCLOSED HANGAR
#define SMALL_ENCLOSED BATHROOM
#define TUNNEL_ENCLOSED CAVE
#define LARGE_SOFTFLOOR CARPETED_HALLWAY
#define MEDIUM_SOFTFLOOR LIVINGROOM
#define SMALL_SOFTFLOOR ROOM
#define ASTEROID CAVE
#define SPACE UNDERWATER

var/list/shatter_sound = list('sound/effects/Glassbr1.ogg','sound/effects/Glassbr2.ogg','sound/effects/Glassbr3.ogg')
var/list/explosion_sound = list('sound/effects/Explosion1.ogg','sound/effects/Explosion2.ogg')
var/list/spark_sound = list('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg','sound/effects/sparks4.ogg')
var/list/rustle_sound = list('sound/effects/rustle1.ogg','sound/effects/rustle2.ogg','sound/effects/rustle3.ogg','sound/effects/rustle4.ogg','sound/effects/rustle5.ogg')
var/list/punch_sound = list('sound/weapons/punch1.ogg','sound/weapons/punch2.ogg','sound/weapons/punch3.ogg','sound/weapons/punch4.ogg')
var/list/clown_sound = list('sound/effects/clownstep1.ogg','sound/effects/clownstep2.ogg')
var/list/swing_hit_sound = list('sound/weapons/genhit1.ogg', 'sound/weapons/genhit2.ogg', 'sound/weapons/genhit3.ogg')
var/list/hiss_sound = list('sound/voice/hiss1.ogg','sound/voice/hiss2.ogg','sound/voice/hiss3.ogg','sound/voice/hiss4.ogg')
var/list/page_sound = list('sound/effects/pageturn1.ogg', 'sound/effects/pageturn2.ogg','sound/effects/pageturn3.ogg')
var/list/fracture_sound = list('sound/effects/bonebreak1.ogg','sound/effects/bonebreak2.ogg','sound/effects/bonebreak3.ogg','sound/effects/bonebreak4.ogg')
var/list/lighter_sound = list('sound/items/lighter1.ogg','sound/items/lighter2.ogg','sound/items/lighter3.ogg')
var/list/trauma_sound = list('sound/effects/gore/trauma1.ogg', 'sound/effects/gore/trauma2.ogg', 'sound/effects/gore/trauma3.ogg')
var/list/casing_sound = list ('sound/weapons/guns/misc/casingfall1.ogg','sound/weapons/guns/misc/casingfall2.ogg','sound/weapons/guns/misc/casingfall3.ogg')
var/list/keyboard_sound = list ('sound/effects/keyboard/keyboard1.ogg','sound/effects/keyboard/keyboard2.ogg', 'sound/effects/keyboard/keyboard3.ogg', 'sound/effects/keyboard/keyboard4.ogg')
var/list/terminal_type = list('sound/machines/terminal_button01.ogg', 'sound/machines/terminal_button02.ogg', 'sound/machines/terminal_button03.ogg',
							  'sound/machines/terminal_button04.ogg', 'sound/machines/terminal_button05.ogg', 'sound/machines/terminal_button06.ogg',
							  'sound/machines/terminal_button07.ogg', 'sound/machines/terminal_button08.ogg')
var/list/gun_sound = list('sound/weapons/gunshot.ogg', 'sound/weapons/gunshot2.ogg', 'sound/weapons/gunshot3.ogg', 'sound/weapons/gunshot4.ogg')
var/list/bullet_hit_wall = list('sound/weapons/guns/misc/ric1.ogg', 'sound/weapons/guns/misc/ric2.ogg', 'sound/weapons/guns/misc/ric3.ogg', 'sound/weapons/guns/misc/ric4.ogg', 'sound/weapons/guns/misc/ric5.ogg')


//Foostep sounds:
var/list/erikafootsteps = list('sound/effects/footsteps/tile1.wav','sound/effects/footsteps/tile2.wav','sound/effects/footsteps/tile3.wav','sound/effects/footsteps/tile4.wav')
var/list/grassfootsteps = list('sound/effects/footsteps/grass/grass1.wav','sound/effects/footsteps/grass/grass2.wav','sound/effects/footsteps/grass/grass3.wav','sound/effects/footsteps/grass/grass4.wav')
var/list/dirtfootsteps = list('sound/effects/footsteps/dirt/dirt1.wav','sound/effects/footsteps/dirt/dirt2.wav','sound/effects/footsteps/dirt/dirt3.wav','sound/effects/footsteps/dirt/dirt4.wav')
var/list/waterfootsteps = list('sound/effects/footsteps/water/slosh1.wav','sound/effects/footsteps/water/slosh2.wav','sound/effects/footsteps/water/slosh3.wav','sound/effects/footsteps/water/slosh4.wav')
var/list/sandfootsteps = list('sound/effects/footsteps/sand/sand_step1.ogg','sound/effects/footsteps/sand/sand_step2.ogg','sound/effects/footsteps/sand/sand_step3.ogg','sound/effects/footsteps/sand/sand_step4.ogg','sound/effects/footsteps/sand/sand_step5.ogg','sound/effects/footsteps/sand/sand_step6.ogg','sound/effects/footsteps/sand/sand_step7.ogg','sound/effects/footsteps/sand/sand_step8.ogg')
var/list/woodfootsteps = list ('sound/effects/footsteps/wood/wood_step1.ogg','sound/effects/footsteps/wood/wood_step2.ogg','sound/effects/footsteps/wood/wood_step3.ogg')
var/list/carpetfootsteps = list ('sound/effects/footsteps/carpet/carpet_step1.ogg','sound/effects/footsteps/carpet/carpet_step2.ogg','sound/effects/footsteps/carpet/carpet_step3.ogg','sound/effects/footsteps/carpet/carpet_step4.ogg','sound/effects/footsteps/carpet/carpet_step5.ogg','sound/effects/footsteps/carpet/carpet_step6.ogg','sound/effects/footsteps/carpet/carpet_step7.ogg','sound/effects/footsteps/carpet/carpet_step8.ogg')
var/list/snowsteps = list('sound/effects/footsteps/snow/snowstep1.ogg', 'sound/effects/footsteps/snow/snowstep2.ogg', 'sound/effects/footsteps/snow/snowstep3.ogg', 'sound/effects/footsteps/snow/snowstep4.ogg')


/proc/absolute(x as num)
	return abs(x)

/proc/playsound(var/atom/source, soundin, vol as num, vary, extrarange as num, falloff, var/is_global, var/frequency)

	soundin = get_sfx(soundin) // same sound for everyone

	if(isarea(source))
		error("[source] is an area and is trying to make the sound: [soundin]")
		return

	frequency = isnull(frequency) ? get_rand_frequency() : frequency // Same frequency for everybody
	var/turf/turf_source = get_turf(source)

 	// Looping through the player list has the added bonus of working for mobs inside containers
	for (var/P in player_list)
		var/mob/M = P
		if(!M || !M.client)
			continue
		if(get_dist(M, turf_source) <= (world.view + extrarange) * 2)
			var/turf/T = get_turf(M)
			if(T && T.z == turf_source.z)
				M.playsound_local(turf_source, soundin, vol, vary, frequency, falloff, is_global)
			var/z_dist = abs(T.z - turf_source.z)//Playing sound on a z-level above or below you.
			if(T && z_dist <= 1)
				M.playsound_local(turf_source, soundin, vol/(1+z_dist), vary, frequency, falloff, is_global)

var/const/FALLOFF_SOUNDS = 0.5

/mob/proc/playsound_local(var/turf/turf_source, soundin, vol as num, vary, frequency, falloff, is_global)
	if(!src.client || ear_deaf > 0)	return
	var/sound/S = soundin
	if(!istype(S))
		soundin = get_sfx(soundin)
		S = sound(soundin)
		S.wait = 0 //No queue
		S.channel = 0 //Any channel
		S.volume = vol
		S.environment = -1
		if (vary)
			if(frequency)
				S.frequency = frequency
			else
				S.frequency = get_rand_frequency()

	//sound volume falloff with pressure
	var/pressure_factor = 1.0

	if(isturf(turf_source))
		// 3D sounds, the technology is here!
		var/turf/T = get_turf(src)

		//sound volume falloff with distance
		var/distance = get_dist(T, turf_source)

		S.volume -= max(distance - world.view, 0) * 2 //multiplicative falloff to add on top of natural audio falloff.

		var/datum/gas_mixture/hearer_env = T.return_air()
		var/datum/gas_mixture/source_env = turf_source.return_air()

		if (hearer_env && source_env)
			var/pressure = min(hearer_env.return_pressure(), source_env.return_pressure())

			if (pressure < ONE_ATMOSPHERE)
				pressure_factor = max((pressure - SOUND_MINIMUM_PRESSURE)/(ONE_ATMOSPHERE - SOUND_MINIMUM_PRESSURE), 0)
		else //in space
			pressure_factor = 0

		if (distance <= 1)
			pressure_factor = max(pressure_factor, 0.15)	//hearing through contact

		S.volume *= pressure_factor

		if (S.volume <= 0)
			return	//no volume means no sound

		var/dx = turf_source.x - T.x // Hearing from the right/left
		S.x = dx
		var/dz = turf_source.y - T.y // Hearing from infront/behind
		S.z = dz
		// The y value is for above your head, but there is no ceiling in 2d spessmens.
		S.y = 1
		S.falloff = (falloff ? falloff : FALLOFF_SOUNDS)

	if(!is_global)

		if(istype(src,/mob/living/))
			var/mob/living/M = src
			if (M.hallucination)
				S.environment = PSYCHOTIC
			else if (M.druggy)
				S.environment = DRUGGED
			else if (M.drowsyness)
				S.environment = DIZZY
			else if (M.confused)
				S.environment = DIZZY
			else if (M.sleeping)
				S.environment = UNDERWATER
			else if (pressure_factor < 0.5)
				S.environment = SPACE
			else
				var/area/A = get_area(src)
				S.environment = A.sound_env

		else if (pressure_factor < 0.5)
			S.environment = SPACE
		else
			var/area/A = get_area(src)
			S.environment = A.sound_env

	src << S

/client/proc/playtitlemusic()
	if(is_preference_enabled(/datum/client_preference/play_lobby_music))
		using_map.lobby_music.play_to(src)

/proc/get_rand_frequency()
	return rand(32000, 55000) //Frequency stuff only works with 45kbps oggs.

/proc/get_sfx(soundin)
	if(istext(soundin))
		switch(soundin)
			if ("shatter") soundin = pick(shatter_sound)
			if ("explosion") soundin = pick(explosion_sound)
			if ("sparks") soundin = pick(spark_sound)
			if ("rustle") soundin = pick(rustle_sound)
			if ("punch") soundin = pick(punch_sound)
			if ("clownstep") soundin = pick(clown_sound)
			if ("swing_hit") soundin = pick(swing_hit_sound)
			if ("hiss") soundin = pick(hiss_sound)
			if ("pageturn") soundin = pick(page_sound)
			if ("fracture") soundin = pick(fracture_sound)
			if ("light_bic") soundin = pick(lighter_sound)
			if ("trauma") soundin = pick(trauma_sound)
			if ("erikafootsteps") soundin = pick(erikafootsteps)
			if ("grassfootsteps") soundin = pick(grassfootsteps)
			if ("dirtfootsteps") soundin = pick(dirtfootsteps)
			if ("waterfootsteps") soundin = pick(waterfootsteps)
			if ("sandfootsteps") soundin = pick(sandfootsteps)
			if ("woodfootsteps") soundin = pick(woodfootsteps)
			if ("carpetfootsteps") soundin = pick(carpetfootsteps)
			if ("snowsteps") soundin = pick(snowsteps)
			if ("casing_sound") soundin = pick(casing_sound)
			if ("keyboard") soundin = pick(keyboard_sound)
			if ("terminal_type")	soundin = pick(terminal_type)
			if ("gunshot") soundin = pick(gun_sound)
			if ("hitwall") soundin = pick(bullet_hit_wall)
	return soundin

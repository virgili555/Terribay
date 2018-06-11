//Due to how large this one is it gets its own file
/datum/job/chaplain
	title = "Bishop"
	department = "Civilian"
	department_flag = CITIZENRY
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of personnel"
	selection_color = "#515151"
	access = list(access_morgue, access_chapel_office, access_crematorium, access_maint_tunnels)
	minimal_access = list(access_morgue, access_chapel_office, access_crematorium)
	outfit_type = /decl/hierarchy/outfit/job/chaplain

	equip(var/mob/living/carbon/human/H, var/alt_title, var/ask_questions = TRUE)
		. = ..()
		if(!.)
			return
		if(!ask_questions)
			return

		var/obj/item/weapon/storage/bible/B = locate(/obj/item/weapon/storage/bible) in H
		if(!B)
			return

		spawn(0)
			var/religion_name = "Holy"
			B.name ="The Holy Bible"

		spawn(1)
			var/deity_name = "God"
			var/accepted = 1
			var/new_book_style = "Bible"

			H.update_inv_l_hand() // so that it updates the bible's item_state in his hand
			if(ticker)
				ticker.Bible_icon_state = B.icon_state
				ticker.Bible_item_state = B.item_state
				ticker.Bible_name = B.name
				ticker.Bible_deity_name = B.deity_name
		return 1

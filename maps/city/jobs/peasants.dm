/datum/job/peasant
	title = "Peasant"
	department = "Civilian"
	department_flag = CITIZENRY
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "everyone"
	selection_color = "#515151"
	economic_modifier = 1
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	outfit_type = /decl/hierarchy/outfit/job/assistant
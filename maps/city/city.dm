#if !defined(USING_MAP_DATUM)

	#include "city_announcements.dm"
	#include "city_areas.dm"
	#include "city_effects.dm"
	#include "city_elevator.dm"
	#include "city_holodecks.dm"
	#include "city_presets.dm"
	#include "city_shuttles.dm"
	#include "city_turfs.dm"
	#include "city_walls.dm"

	#include "city_unit_testing.dm"
	#include "city_zas_tests.dm"

	#include "loadout/loadout_accessories.dm"
	#include "loadout/loadout_eyes.dm"
	#include "loadout/loadout_head.dm"
	#include "loadout/loadout_shoes.dm"
	#include "loadout/loadout_suit.dm"
	#include "loadout/loadout_uniform.dm"
	#include "loadout/loadout_xeno.dm"

	#include "../shared/exodus_torch/_include.dm"

	//#include "city-1.dmm"
	#include "city-2.dmm"
	//#include "city-3.dmm"
	//#include "city-4.dmm"
	//#include "city-5.dmm"
	//#include "city-6.dmm"
	//#include "city-7.dmm"

	#include "../../code/modules/lobby_music/absconditus.dm"
	#include "../../code/modules/lobby_music/clouds_of_fire.dm"
	#include "../../code/modules/lobby_music/endless_space.dm"
	#include "../../code/modules/lobby_music/dilbert.dm"
	#include "../../code/modules/lobby_music/space_oddity.dm"

	#define USING_MAP_DATUM /datum/map/city

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring city

#endif

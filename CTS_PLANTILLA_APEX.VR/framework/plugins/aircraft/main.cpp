
#ifdef BRM_PLUGIN_META
	class Aircraft
	{
		name = "Aircraft Loadout";
		version = 1;
		authors[] = {"Grumpy Old Man"};
		description = "Change aircraft loadouts ingame";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif

#ifdef BRM_PLUGIN_DIALOGS
	#include "dialogs\dialog_parents.hpp"
	#include "dialogs\dialog_controls.hpp"
#endif

#ifdef BRM_PLUGIN_COMMENU
	#include "functions\fn_aircraftLoadoutMenu.hpp"
#endif


#ifdef BRM_PLUGIN_META
	class t8
	{
		name = "T8";
		version = 0.3;
		authors[] = {"T-800"};
		description = "This plugin has several handy functions in order to spawn AI units to perform several tasks.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif

#ifdef BRM_PLUGIN_DIALOGS
	#include "Config.hpp"
#endif

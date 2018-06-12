
#ifdef BRM_PLUGIN_META
	class dzn_brv
	{
		name = "AAR Viewer";
		version = 1;
		authors[] = {"Proxen"};
		description = "Loads up functions and variables for AAR Viewer to work.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif

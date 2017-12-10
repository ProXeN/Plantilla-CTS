
#ifdef BRM_PLUGIN_META
	class conversation_system
	{
		name = "Conversation System Plugin";
		version = 1;
		authors[] = {"IndeedPete"};
		description = "Conversation System Plugin";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif

#ifdef BRM_PLUGIN_DIALOGS
	#include "dialogs\dialogs.hpp"
	#include "dialogs\conversationBox.hpp"
#endif

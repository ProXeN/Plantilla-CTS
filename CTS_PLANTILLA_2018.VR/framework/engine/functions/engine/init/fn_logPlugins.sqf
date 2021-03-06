/*
================================================================================

NAME:
    BRM_fnc_logPlugins

AUTHOR(s):
    Nife

DESCRIPTION:
    Reads and logs all plugins based on their meta-data attributes.

PARAMETERS:
    Nothing.

USAGE:
    [] call BRM_fnc_logPlugins

RETURNS:
    Nothing.

================================================================================
*/

plugins_loaded = false;

usedPlugins = "true" configClasses (missionConfigFile >> "CfgPlugins") apply { configName _x };
usedPlugins sort true;

ENGINE_plugins = "true" configClasses (configFile >> "CfgBRMPlugins") apply { configName _x };
ENGINE_plugins sort true;

plugins_loaded = true;

0 spawn {
	waitUntil { !isNil "framework_init_time" };

	private _subject = "BRM_diary";
	player createDiarySubject [_subject, "Framework"];

	private _plugins = usedPlugins apply {
		private _cfg = configFile >> "CfgBRMPlugins" >> _x;
		format [
			"  <execute expression='hint ""%1 v%2\nby %3\n\n%4""'>[?]</execute> <font color='#E6E682'>%1 v%2</font> by %3.",
			getText ( _cfg >> "name"),
			getNumber ( _cfg >> "version"),
			[getArray ( _cfg >> "authors")] call BRM_fnc_verboseArray,
			getText ( _cfg >> "description")
		]
	};

	player createDiaryRecord [_subject, ["Framework",
			([
				format ["Initialized in %1 seconds.", framework_init_time],
				"",
				"<font face='RobotoCondensedBold'>Plugins:</font>"
			] + _plugins) joinString "<br />"
	]];
};

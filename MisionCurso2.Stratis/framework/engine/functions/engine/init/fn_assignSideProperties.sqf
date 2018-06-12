
#include "..\..\..\..\..\mission\loadouts\includes\faction-info-index.sqf"

{
	private _sideProperties = [missionNamespace getVariable format ["side_%1_faction", _x]] call BRM_fnc_getLoadoutProperty;

	private _factionInfo = _sideProperties select FACTION_INFO;
	missionNamespace setVariable [format ["side_%1_name", _x], _factionInfo select FACTION_NAME];
	missionNamespace setVariable [format ["side_%1_callsigns", _x], _factionInfo select FACTION_CALLSIGNS];
} forEach ["a", "b", "c"];

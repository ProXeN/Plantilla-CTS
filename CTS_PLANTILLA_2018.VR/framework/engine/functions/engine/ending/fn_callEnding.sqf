/*
================================================================================

NAME:
    BRM_fnc_callEnding

AUTHOR(s):
    Nife

DESCRIPTION:
    This function will effectively end the mission and call other ending events.

PARAMETERS:
    0 - Ending event that should be called (STRING)

USAGE:
    ["victory"] call BRM_fnc_callEnding

RETURNS:
    Nothing.

================================================================================
*/

// Ends the mission.
if (!isRemoteExecuted && isMultiplayer || count _this == 1) then {
	if !(isServer && mission_running) exitWith {};

	mission_running = false; publicVariable "mission_running";

	params ["_ending"];

	// Server reads all mission-related ending cases.
	_this call compile preprocessFile "mission\settings\endings.sqf";

	if (hasInterface) then {
		player allowDamage false;
	};

	if (isServer) then { sleep 3 };

	[_ending, _isWinner, true] spawn BIS_fnc_endMission;
};

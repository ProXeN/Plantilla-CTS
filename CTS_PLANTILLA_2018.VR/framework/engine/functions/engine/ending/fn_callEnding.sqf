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
    ["victory"] spawn BRM_fnc_callEnding

RETURNS:
    Nothing.

================================================================================
*/

// Ends the mission.

if (!isRemoteExecuted && isMultiplayer) then {
	if !(isServer && mission_running) exitWith {};

	mission_running = false; publicVariable "mission_running";

	params ["_ending", "_victory"];

	[_ending, _victory] remoteExec ["BRM_fnc_callEnding", 0];
} else {
	params ["_ending", "_victory"];

	if (hasInterface) then {
		player allowDamage false;
	};

	if (isServer) then { sleep 3 };

	[_ending, _victory] spawn BIS_fnc_endMission;
};

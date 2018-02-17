/*
================================================================================

NAME:
    BRM_fnc_setTask

AUTHOR(s):
    Nife

DESCRIPTION:
    Sets a task's state over the network.

PARAMETERS:
    0 - Task ID (STRING)
    1 - Desired state (STRING)

USAGE:
    ["myTaskID", "FAILED"] call BRM_fnc_setTask

RETURNS:
    Nothing.

================================================================================
*/

params ["_task", "_state"];

_state = toUpper _state;

if (([_task] call BIS_fnc_taskState) != _state) then {
	[_task, _state, true] call BIS_fnc_taskSetState;

	{
		{
			if (_x select 0 == _task) exitWith {
				private _index = switch (_state) do {
					case "SUCCEEDED": { 4 };
					case "FAILED";
					case "CANCELED":  { 5 };
					default           { -1 };
				};
				if (_index != -1) then {
					call (_x select _index);
				};
			};
		} forEach _x;
	} forEach BRM_tasks;
};

/*
================================================================================

NAME:
    BRM_fnc_checkTasks

AUTHOR(s):
    Nife

DESCRIPTION:
    Runs a server-side check that evaluates the conditions for all assigned
    tasks, followed by the appropriate functions.

PARAMETERS:
    Nothing.

USAGE:
    [] call BRM_fnc_checkTasks

RETURNS:
    Nothing;

================================================================================
*/

if (!isServer) exitWith {};

a_extracting = false;
b_extracting = false;
c_extracting = false;

while {(mission_running)} do {

    if ((count tasks_a > 0)&&(mission_running)) then {
        _count = 0;
        {
            _id = _x select 0;
            _taskState = [_id] call BIS_fnc_taskState;

            _wincond = ((call compile format ["%1",_x select 1]) || (_taskState == "Succeeded"));
            _losecond = ((call compile format ["%1",_x select 2]) || (_taskState == "Failed"));

            _done = false;
            _secondary = (_id in tasks_secondary_a);
            _primary = (_id in tasks_primary_a);

            if (_wincond) then {
                if (_primary) then { _count = _count + 1 };

                [_id,"succeeded", true] call BRM_fnc_setTask;
                if !([_id] in tasks_done_a) then {
                    tasks_done_a pushBack [_id];

                    if ("time_limit" in usedPlugins) then {
                        [mission_time_added] call BRM_TimeLimit_fnc_addTime;
                    };
                };
            };

            if (_losecond) then {
                if (_primary || _secondary) then {
                    [_id,"failed", true] call BRM_fnc_setTask;
                    if (_primary) then {
                      [endings_defeat] call BRM_fnc_callEnding;
                    };
                } else {
                    [_id,"canceled", true] call BRM_fnc_setTask;
                };
            };
        } forEach tasks_a;

        if ((_count == (count tasks_primary_a)) && (count tasks_primary_a >= 1)) then {
            _escapeID = ["aExtract"] call BIS_fnc_taskState;

            if ((side_a_side in mission_require_extraction) && ("f_evade_escape" in usedPlugins) && !(_escapeID == "Succeeded")) then {
                if (!a_extracting) then {
                    [extraction_a select 0, extraction_a select 1, 100, "mission_require_extraction = mission_require_extraction - [side_a_side]"] spawn f_evade_escape_fnc_reachObject;

                    [side_a_side,"aExtract",["Extracción","Llega hasta el punto de extracción.", "exit", []],
                    ["(true)","!(side_a_side in mission_require_extraction)"],2,
                    ["if (mission_extraction_enable_music) then {[mission_extraction_tracks call BIS_fnc_selectRandom] call BRM_fnc_playGlobal}", "", ""]
                    ] spawn BRM_fnc_newTask;

                    a_extracting = true;
                };
            } else {
                if (true) exitWith {
                  [endings_victory] call BRM_fnc_callEnding;
                };
            };
        };
    };

// =============================================================================

    if ((count tasks_b > 0)&&(mission_running)) then {
        _count = 0;
        {
            _id = _x select 0;
            _taskState = [_id] call BIS_fnc_taskState;

            _wincond = ((call compile format ["%1",_x select 1]) || (_taskState == "Succeeded"));
            _losecond = ((call compile format ["%1",_x select 2]) || (_taskState == "Failed"));

            _done = false;
            _secondary = (_id in tasks_secondary_b);
            _primary = (_id in tasks_primary_b);

            if (_wincond) then {
                if (_primary) then { _count = _count + 1 };

                [_id,"succeeded", true] call BRM_fnc_setTask;
                if !([_id] in tasks_done_b) then {
                    tasks_done_b pushBack [_id];

                    if ("time_limit" in usedPlugins) then {
                        [mission_time_added] call BRM_TimeLimit_fnc_addTime;
                    };
                };
            };

            if (_losecond) then {
                if (_primary || _secondary) then {
                    [_id,"failed", true] call BRM_fnc_setTask;
                    if (_primary) then {
                      [endings_defeat] call BRM_fnc_callEnding;
                    };
                } else {
                    [_id,"canceled", true] call BRM_fnc_setTask;
                };
            };
        } forEach tasks_b;

        if ((_count == (count tasks_primary_b)) && (count tasks_primary_b >= 1)) then {
            _escapeID = ["bExtract"] call BIS_fnc_taskState;

            if ((side_b_side in mission_require_extraction) && ("f_evade_escape" in usedPlugins) && !(_escapeID == "Succeeded")) then {
                if (!b_extracting) then {
                    [extraction_b select 0, extraction_b select 1, 100, "mission_require_extraction = mission_require_extraction - [side_b_side]"] spawn f_evade_escape_fnc_reachObject;

                    [side_b_side,"bExtract",["Extracción","Llega hasta el punto de extracción.", "exit", []],
                    ["(true)","!(side_b_side in mission_require_extraction)"],2,
                    ["if (mission_extraction_enable_music) then {[mission_extraction_tracks call BIS_fnc_selectRandom] call BRM_fnc_playGlobal}", "", ""]
                    ] spawn BRM_fnc_newTask;

                    b_extracting = true;
                };
            } else {
                if (true) exitWith {
                        [endings_victory] call BRM_fnc_callEnding;
                };
            };
        };
    };

// =============================================================================

    if ((count tasks_c > 0)&&(mission_running)) then {
        _count = 0;
        {
            _id = _x select 0;
            _taskState = [_id] call BIS_fnc_taskState;

            _wincond = ((call compile format ["%1",_x select 1]) || (_taskState == "Succeeded"));
            _losecond = ((call compile format ["%1",_x select 2]) || (_taskState == "Failed"));

            _done = false;
            _secondary = (_id in tasks_secondary_c);
            _primary = (_id in tasks_primary_c);

            if (_wincond) then {
                if (_primary) then { _count = _count + 1 };

                [_id,"succeeded", true] call BRM_fnc_setTask;
                if !([_id] in tasks_done_c) then {
                    tasks_done_c pushBack [_id];

                    if ("time_limit" in usedPlugins) then {
                        [mission_time_added] call BRM_TimeLimit_fnc_addTime;
                    };
                };
            };

            if (_losecond) then {
                if (_primary || _secondary) then {
                    [_id,"failed", true] call BRM_fnc_setTask;
                    if (_primary) then {
                      [endings_defeat] call BRM_fnc_callEnding;
                    };
                } else {
                    [_id,"canceled", true] call BRM_fnc_setTask;
                };
            };
        } forEach tasks_c;

        if ((_count == (count tasks_primary_c)) && (count tasks_primary_c >= 1)) then {
          _escapeID = ["cExtract"] call BIS_fnc_taskState;

            if ((side_c_side in mission_require_extraction) && ("f_evade_escape" in usedPlugins) && !(_escapeID == "Succeeded")) then {
                if (!c_extracting) then {
                    [extraction_c select 0, extraction_c select 1, 100, "mission_require_extraction = mission_require_extraction - [side_c_side]"] spawn f_evade_escape_fnc_reachObject;

                    [side_c_side,"cExtract",["Extracción","Llega hasta el punto de extracción.", "exit", []],
                    ["(true)","!(side_c_side in mission_require_extraction)"],2,
                    ["if (mission_extraction_enable_music) then {[mission_extraction_tracks call BIS_fnc_selectRandom] call BRM_fnc_playGlobal}", "", ""]
                    ] spawn BRM_fnc_newTask;

                    c_extracting = true;
                };
            } else {
                if (true) exitWith {
                        [endings_victory] call BRM_fnc_callEnding;
                };
            };
        };
    };

// =============================================================================

    sleep 3;
};

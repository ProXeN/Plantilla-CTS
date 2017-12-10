
// ============================================================================
//                                                                             |
//         EVENT SCRIPT: Executes whenever a player unit is killed.            |
//                                                                             |
// ============================================================================

_unit = _this select 0;
_killer = _this select 1;

switch (true) do {
    case (mission_players_A find _unit >= 0): {mission_players_a = mission_players_a - [_unit]; publicVariable "mission_players_A";};
    case (mission_players_B find _unit >= 0): {mission_players_B = mission_players_B - [_unit]; publicVariable "mission_players_B";};
    case (mission_players_C find _unit >= 0): {mission_players_C = mission_players_C - [_unit]; publicVariable "mission_players_C";};
};

[_unit, _killer] call BRM_fnc_handleScore;

["Initialize", [player, [], true]] call BIS_fnc_EGSpectator;

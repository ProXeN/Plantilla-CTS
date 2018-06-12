
// ============================================================================
//                                                                             |
//         EVENT SCRIPT: Executes whenever a player unit is killed.            |
//                                                                             |
// ============================================================================

_unit = _this select 0;
_killer = _this select 1;

mission_players = mission_players - [_unit]; publicVariable "mission_players";

["Initialize", [player, [], true]] call BIS_fnc_EGSpectator;

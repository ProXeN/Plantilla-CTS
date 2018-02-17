
// ============================================================================
//                                                                             |
//     EVENT SCRIPT: Executes whenever an AI unit is killed.                   |
//                                                                             |
// ============================================================================

_unit = _this select 0;
_killer = _this select 1;

_var = (_unit getVariable "evented");
if (!isNil "_var") exitWith {};
_unit setVariable ["evented",true];

_unit spawn f_remove_body_fnc_removeBody;

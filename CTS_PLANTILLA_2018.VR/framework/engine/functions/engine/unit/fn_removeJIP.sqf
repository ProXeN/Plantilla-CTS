/*
================================================================================

NAME:
    BRM_fnc_removeJIP
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Displays a message to any players who aren't allowed to Join in Progress.

PARAMETERS:
    0 - Player (OBJECT)
    
USAGE:
    [player] spawn BRM_fnc_removeJIP
    
RETURNS:
    Nothing.

================================================================================
*/

_unit = _this select 0;

["Initialize", [_unit, [], true]] call BIS_fnc_EGSpectator;
_unit setdamage 1;

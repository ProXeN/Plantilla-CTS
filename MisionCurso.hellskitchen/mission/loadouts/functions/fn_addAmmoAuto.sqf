
params ["_unit", "_weapon", "_amount", "_type"];

_magazine = [_weapon, _type] call BRM_fnc_getAmmoClass;

if (_magazine != "") then {
    [_unit, _magazine, _amount] call BRM_fnc_addAmmo;
};

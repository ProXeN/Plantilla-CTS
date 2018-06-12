// ws_fnc_spawnGunners
// By Zriel | CTSarma.es
/*
FEATURE
Spawn AI gunners on selected vehicles.
USAGE

[object] call ws_fnc_spawnGunners

PARAMETERS
1. The object (vehicle) to spawn gunners on.  | MANDATORY

RETURNS
crew

NOTE
ARMA 3 only

*/

if !(isServer) exitWith {};

private ["_vehicle","_crew"];

_vehicle = _this select 0;

if (!(local _vehicle)) exitWith {};

createVehicleCrew _vehicle;
_crew = crew _vehicle;

{
   if ((assignedVehicleRole _x select 0 == "Turret") && (assignedVehicleRole _x select 1 select 0 == 0)) then {_vehicle deleteVehicleCrew _x; _crew = _crew - [_x];};
    if (driver _vehicle == _x) then {_vehicle deleteVehicleCrew _x; _crew = _crew - [_x];};
} forEach _crew;

_crew;
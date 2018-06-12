params ["_vehicle","_text"];

_playersInVehicle = [];
{
	if (isPlayer _x) then {
		_playersInVehicle pushBack _x;
	}
} forEach crew _vehicle;

[[[groupId group driver _vehicle,_text]],"VEHICLE",0.10] remoteExec ["BRM_fnc_simpleConv",_playersInVehicle ,false];

params [
	"_vehicle",
	["_thisMission", nil,[],2]
];
scopeName "FlyToBase";

// if not part of a flying mission create a new one
if (isNil "_thisMission") then {
	_thisMissionNr = (_vehicle getVariable ["missionNr",0]) + 1;
	_vehicle setVariable ["missionNr", _thisMissionNr, true];

	_thisMission = [_vehicle,_thisMissionNr];
};

{
	deleteWaypoint _x
} foreach waypoints group driver _vehicle;

_baseLZPos = _vehicle getVariable "baseLZ";

_heliPad = "Land_HelipadEmpty_F" createVehicle _baseLZPos;

_flyToWaypoint = (group driver _vehicle) addWaypoint [_baseLZPos,0,0];
_flyToWaypoint setWaypointType "MOVE";
_flyToWaypoint setWaypointSpeed "FULL";
_flyToWaypoint setWaypointBehaviour "CARELESS";
_flyToWaypoint setWaypointCombatMode "BLUE";
_flyToWaypoint setWaypointCompletionRadius 100;
_flyToWaypoint setWaypointStatements ["true", "(vehicle this) land 'LAND';"];

//hint str(_thisMission);
waitUntil {((_vehicle distance2D _baseLZPos) < 300) || !(_thisMission call BRM_transport_fnc_checkMissionIdActive)};
if ( !(_thisMission call BRM_transport_fnc_checkMissionIdActive)) then {
	deleteVehicle _heliPad;
	breakOut "FlyToBase";
};


// Landing Comms
if ([_vehicle] call BRM_transport_fnc_helicopterIsFlying) then  {
	_groupID = groupId group driver _vehicle;
	_text = format ["%1 solicitando aterrizaje.", _groupID];
	[groupId group driver _vehicle,_text] call BRM_transport_fnc_commsSide;
	sleep 1.5;
	_text = format ["%1 luz verde para aterrizaje.", _groupID];
	[_text] call BRM_transport_fnc_commsHQ;
};

setWind [0,0,true]; // prevent stuck helicopter during duststorm

waitUntil {(!([_vehicle] call BRM_transport_fnc_helicopterIsFlying)) || {!canMove _vehicle} || !(_thisMission call BRM_transport_fnc_checkMissionIdActive)};
if ( !(_thisMission call BRM_transport_fnc_checkMissionIdActive)) then {
	breakOut "FlyToBase";
};

[_vehicle,"Estamos en base."] call BRM_transport_fnc_commsPilotToVehicle;


deleteVehicle _heliPad;

{
	deleteWaypoint _x
} foreach waypoints group driver _vehicle;

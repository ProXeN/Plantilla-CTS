/* 	Script starting here  */
scopeName "FlyTo";

params [
	"_destinationPosition",
	["_vehicle", objNull],
	["_isPickup", false]
];

_radius = 900;


_mainAOPos = getMarkerPos "mrk_noLZ";

//ObjectivePossitions

if (!alive _vehicle) then {
	breakOut "FlyTo";
};


//cleanup possible prevoius prevoious
deleteVehicle (_vehicle getVariable ["targetPad", objNull]);
deleteMarker (_vehicle getVariable ["lzMarker",""]);



/** New Tranport Mission starts here **/

// set mission number -> invalidates old instances of this script running.
_thisMissionNr = (_vehicle getVariable ["missionNr",0]) + 1;
_vehicle setVariable ["missionNr", _thisMissionNr, true];

_thisMission = [_vehicle,_thisMissionNr];

_cleanupMission = {
	params ["_mission"];

	_markerName = str(_mission select 0) + "LZ" + str(_mission select 1);
	deleteMarker _markerName;
};

_vehicle setVariable ["targetPos",_destinationPosition,true];
_driver = driver _vehicle;

/* Set landing zone map marker */

_markerName = str(_vehicle) + "LZ" + str(_thisMissionNr);

_mrkcustomLZ1 = createMarker [_markerName, _destinationPosition];
_mrkcustomLZ1 setMarkerShape "ICON";
_mrkcustomLZ1 setMarkerSize [1,1];
_mrkcustomLZ1 setMarkerColor "colorBLUFOR";
_mrkcustomLZ1 setMarkerType "hd_pickup";
_mrkcustomLZ1 setMarkerText ("LZ " + (groupId group _driver));
_vehicle setVariable ["lzMarker",_mrkcustomLZ1,true];

_heliPad = "Land_HelipadEmpty_F" createVehicle _destinationPosition; // invisible landingpad to specify exact landing position
_vehicle setVariable ["targetPad",_heliPad,true];

{
	deleteWaypoint _x
} foreach waypoints group _driver;

_vehicle setVariable ["landingInProgress",false,true];


_waypointIndex = 0;
/* Set Waypoint,Takeoff */

_iSaftyCount = 500;
_bHalfWayWaypoint = false;
_DirAtoB = [getPos _vehicle, _destinationPosition] call BIS_fnc_DirTo;
_AvoidZonePos = getMarkerPos "mrk_noLZ";
_stepPos = getPos _vehicle;
_stepDistLeft = _vehicle distance _destinationPosition;
_bEndSteps = false;
while {!_bEndSteps && _iSaftyCount > 0} do {
	_iSaftyCount = _iSaftyCount - 1;
	_stepPos = _stepPos getPos [100,_DirAtoB];
	_stepDistToAO = _stepPos distance _AvoidZonePos;
	_stepDistLeft = _stepPos distance _destinationPosition;

	if (false) then {
		_markerNameSteps = str(_vehicle) + "Step_" + str(500 - _iSaftyCount);
		_mrkcustomSteps = createMarker [_markerNameSteps, _stepPos];
		_mrkcustomSteps setMarkerShape "ICON";
		_mrkcustomSteps setMarkerSize [1,1];
		_mrkcustomSteps setMarkerType "hd_dot";
		_mrkcustomSteps setMarkerText ("Step " + str(_stepDistLeft));
		sleep 0.1;
		hint str(_iSaftyCount);
	};

	if (_stepDistToAO < 1000) then {
		_bEndSteps = true;
		_divertDirectionA = ([_DirAtoB,80] call BRM_transport_fnc_AddToDirection);
		_newPosA = _AvoidZonePos getPos [2000,_divertDirectionA];
		_divertDirectionB = ([_DirAtoB,-80] call BRM_transport_fnc_AddToDirection);
		_newPosB = _AvoidZonePos getPos [2000,_divertDirectionB];
		_totalDistA = (_vehicle distance _newPosA) + (_newPosA distance _destinationPosition);
		_totalDistB = (_vehicle distance _newPosB) + (_newPosB distance _destinationPosition);
		_newPos = nil;
		if (_totalDistA < _totalDistB) then {
			_newPos = _newPosA;
		}
		else {
			_newPos = _newPosB;
		};
		_waypointIndex = _waypointIndex + 1;
		_flyToLZMid = group _driver addWaypoint [_newPos,0,0];
		_flyToLZMid setWaypointType "MOVE";
		_flyToLZMid setWaypointSpeed "FULL";
		_flyToLZMid setWaypointBehaviour "CARELESS";
		_flyToLZMid setWaypointCombatMode "BLUE";
		_flyToLZMid setWaypointCompletionRadius 1000;
	};
	if (_stepDistLeft < 300) then {
		_bEndSteps = true;
	};
};


_flyToLZ = group _driver addWaypoint [_destinationPosition,0,_waypointIndex];
_flyToLZ setWaypointType "MOVE";
_flyToLZ setWaypointSpeed "FULL";
_flyToLZ setWaypointBehaviour "CARELESS";
_flyToLZ setWaypointCombatMode "BLUE";
_flyToLZ setWaypointCompletionRadius 100;
_flyToLZ setWaypointStatements ["true", "(vehicle this) land 'GET IN'; (vehicle this) setVariable [""landingInProgress"",true,true]"];

if (!([_vehicle] call BRM_transport_fnc_helicopterIsFlying)) then {
	_text = format ["%1, luz verde para despegue.", groupId group _driver];
	[_text] call BRM_transport_fnc_commsHQ;
};

if (!([_vehicle] call BRM_transport_fnc_helicopterIsFlying)) then {
	waitUntil {(!([_vehicle] call BRM_transport_fnc_helicopterIsFlying)) || !(_thisMission call BRM_transport_fnc_checkMissionIdActive)};
	if (!(_thisMission call BRM_transport_fnc_checkMissionIdActive)) then {
		[_thisMission] call _cleanupMission;
		breakOut "FlyTo";
	};
	sleep 2;

	[_vehicle,"Nos vamos."] call BRM_transport_fnc_commsPilotToVehicle;
} else {
	[_vehicle,"Recibido, cambiando ruta."]call BRM_transport_fnc_commsPilotToVehicle;
};

/* Landing done **/

waitUntil { ((_vehicle getVariable ["landingInProgress",false]) || !(_thisMission call BRM_transport_fnc_checkMissionIdActive)); };
if (!(_thisMission call BRM_transport_fnc_checkMissionIdActive)) then {
	_vehicle land "NONE";
	[_thisMission] call _cleanupMission;
	breakOut "FlyTo";
};

waitUntil { ((!([_vehicle] call BRM_transport_fnc_helicopterIsFlying)) || {!canMove _vehicle} || !(_thisMission call BRM_transport_fnc_checkMissionIdActive)); };
if (!(_thisMission call BRM_transport_fnc_checkMissionIdActive)) then {
	_vehicle land "NONE";
	[_thisMission] call _cleanupMission;
	breakOut "FlyTo";
;
};

sleep 2;

/* Post landing,cleanup */
{
	deleteWaypoint _x
} foreach waypoints _driver;

if (!_isPickup) then {
	[_vehicle, "Hemos llegado. ¡Buena suerte!"] call BRM_transport_fnc_commsPilotToVehicle;
}
else {
	[groupId group driver _vehicle,"A la espera en LZ designada."] call BRM_transport_fnc_commsSide;
};


sleep 5;

/* wait for empty helicopter */

if (!_isPickup) then {
	waitUntil { ([_vehicle] call BRM_transport_fnc_isOnlyBoardCrewOnboard) || !(_thisMission call BRM_transport_fnc_checkMissionIdActive) }; // helicopter empty except pilot + crew

	if (!(_thisMission call BRM_transport_fnc_checkMissionIdActive)) then {
		_vehicle land "NONE";
		[_thisMission] call _cleanupMission;
		breakOut "FlyTo";
	};
	// RADIO :  We're RTB.
	_text = format ["%1 volviendo a base.", groupId group driver _vehicle];
	[groupId group driver _vehicle,_text] call BRM_transport_fnc_commsSide;

	/* RTB */
	[_vehicle,_thisMission] spawn BRM_transport_fnc_flyToBase;
}
else {
	waitUntil { !([_vehicle] call BRM_transport_fnc_isOnlyBoardCrewOnboard) || !(_thisMission call BRM_transport_fnc_checkMissionIdActive) }; // helicopter has passengers (not just pilot + crew)
	if (!(_thisMission call BRM_transport_fnc_checkMissionIdActive)) then {
		_vehicle land "NONE";
		[_thisMission] call _cleanupMission;
		breakOut "FlyTo";
	};
	if (!(_thisMission call BRM_transport_fnc_checkMissionIdActive)) then {
		_text = format ["%1 volviendo a base.", groupId group driver _vehicle];
		[groupId group driver _vehicle,_text] call BRM_transport_fnc_commsSide;

		/* RTB */
		[_vehicle,_thisMission] spawn BRM_transport_fnc_flyToBase;
	}
	else {
		[_vehicle, "Bienvenido a bordo. ¿A dónde te llevamos?"] call BRM_transport_fnc_commsPilotToVehicle;
	};
};

sleep 4;

[_thisMission] call _cleanupMission;

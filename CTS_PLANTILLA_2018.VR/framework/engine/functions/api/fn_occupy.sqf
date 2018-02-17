//Example:
//[EAST, "mrk_town"] spawn BRM_fnc_occupy

params ["_side", "_marker"];

_rad = selectMin (getMarkerSize _marker);

// Scale the marker down if the player count is low
_cnt = count mission_players;
if (_cnt < 13) then {
	_scale = 1.0 - (((20-_cnt)/20) * 0.25);
	_rad = _rad * _scale;
	_marker setMarkerSize [_rad, _rad];
};


_buildings = nearestTerrainObjects [getMarkerPos _marker, ["house"], _rad, false, true];
_buildingPositions = [];
{
	_buildingPositions = _buildingPositions + (_x buildingPos -1);
} forEach _buildings;

// _buildingPositions contains all, well, building positions in the area.
_bpIndex = 1 + 0.2 * (((count _buildingPositions) - 400) / 800);

_difficultyIndex = 0.8 *((count mission_players) * ( 0.5 * (3)) * _bpIndex);


_enemyInBuilding = floor (2*_difficultyIndex);
_enemyFootMobiles = floor (1.7 * _difficultyIndex);
_enemyVehicles = floor (0.15 * _difficultyIndex);
_faction = [_side, "faction"] call BRM_fnc_getSideInfo;

// Place in buildings
_buildPeople = (getMissionLayerEntities "Building") select 0;

while {_enemyInBuilding > 0} do {
	_pos = selectRandom _buildingPositions;
	_dude = selectRandom _buildPeople;

	_group = createGroup [_side, true];

	_newDude = _group createUnit [(typeOf _dude), _pos, [], 0, "NONE"];
	_newDude disableAI "PATH";
	_newDude disableAI "COVER";
	_newDude setDir random 360;
  [_newDude, _faction] spawn BRM_fnc_initAI;

	_enemyInBuilding = _enemyInBuilding - 1;
};

/* // Delete the building templates
{
	deleteVehicle _x;
} forEach _buildPeople; */

// Road patrols
// Gather the groups first
_groups = [];
_patrols = (getMissionLayerEntities "Footmobile") select 0;
{
	if (!(group _x in _groups)) then {
		_groups pushBack group _x;
	};
} forEach _patrols;

while {_enemyFootMobiles > 0} do {
	_grp = selectRandom _groups;
	_enemyFootMobiles = _enemyFootMobiles - (count (units _grp));
	// Get three road positions in our marker
	_pos1 = [getMarkerPos _marker, _rad] call BRM_fnc_getRoadPosition;
	_pos2 = [getMarkerPos _marker, _rad] call BRM_fnc_getRoadPosition;
	_pos3 = [getMarkerPos _marker, _rad] call BRM_fnc_getRoadPosition;

	// Spawn the group
	_newGroup = createGroup [_side, true];
	{
		_newDude = _newGroup createUnit [(typeof _x), _pos1, [], 0, "NONE"];
    [_newDude, _faction] spawn BRM_fnc_initAI;
	} forEach units _grp;

	// Create a patrol route
	_wp = _newGroup addWaypoint [_pos1, 0];
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointType "MOVE";
	_wp setWaypointCombatMode "YELLOW";
	_wp setWaypointBehaviour "SAFE";

	_wp = _newGroup addWaypoint [_pos2, 0];
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointType "MOVE";
	_wp setWaypointCombatMode "YELLOW";
	_wp setWaypointBehaviour "SAFE";

	_wp = _newGroup addWaypoint [_pos1, 0];
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointType "CYCLE";
	_wp setWaypointCombatMode "YELLOW";
	_wp setWaypointBehaviour "SAFE";
};

/* // Delete templates
{
	deleteVehicle _x;
} forEach _patrols; */

// Vehicles
_vehicles = (getMissionLayerEntities "Vehicle") select 0;

while {_enemyVehicles > 0 } do {
	_veh = selectRandom _vehicles;
	_enemyVehicles = _enemyVehicles - 1;

	// Get three road positions in our marker
	_pos1 = [getMarkerPos _marker, _rad] call BRM_fnc_getRoadPosition;
	_pos2 = [getMarkerPos _marker, _rad] call BRM_fnc_getRoadPosition;
	_pos3 = [getMarkerPos _marker, _rad] call BRM_fnc_getRoadPosition;

	// spawn the vehicle
	_newGroup = createGroup [_side, true];
	_vehicle = (typeof _veh) createVehicle _pos1;
	[_vehicle, _newGroup] call BIS_fnc_spawnCrew;

	// Create a patrol route
	_wp = _newGroup addWaypoint [_pos1, 0];
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointType "MOVE";
	_wp setWaypointCombatMode "YELLOW";
	_wp setWaypointBehaviour "SAFE";

	_wp = _newGroup addWaypoint [_pos2, 0];
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointType "MOVE";
	_wp setWaypointCombatMode "YELLOW";
	_wp setWaypointBehaviour "SAFE";

	_wp = _newGroup addWaypoint [_pos1, 0];
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointType "CYCLE";
	_wp setWaypointCombatMode "YELLOW";
	_wp setWaypointBehaviour "SAFE";
};

/* // Delete templates
{
	deleteVehicle _x;
} forEach _vehicles; */

// Civilians
_civPeople = (getMissionLayerEntities "Civilian") select 0;
for "_i" from 1 to 15 do {
	_pos1 = selectRandom _buildingPositions;

	_dude = selectRandom _civPeople;
	_newGroup = createGroup [civilian, true];
	_newDude = _newGroup createUnit [(typeof _dude), _pos1, [], 0, "NONE"];
	_newDude setDir random 360;

	if (random 10 > 4) then {
		// Create a patrol route between buildings
		_pos2 = selectRandom _buildingPositions;
		_pos3 = selectRandom _buildingPositions;

		_wp = _newGroup addWaypoint [_pos1, 0];
		_wp setWaypointSpeed "LIMITED";
		_wp setWaypointType "MOVE";
		_wp setWaypointCombatMode "YELLOW";
		_wp setWaypointBehaviour "SAFE";

		_wp = _newGroup addWaypoint [_pos2, 0];
		_wp setWaypointSpeed "LIMITED";
		_wp setWaypointType "MOVE";
		_wp setWaypointCombatMode "YELLOW";
		_wp setWaypointBehaviour "SAFE";

		_wp = _newGroup addWaypoint [_pos1, 0];
		_wp setWaypointSpeed "LIMITED";
		_wp setWaypointType "CYCLE";
		_wp setWaypointCombatMode "YELLOW";
		_wp setWaypointBehaviour "SAFE";
	};
};

/* // Delete template
{
	deleteVehicle _x;
} forEach _civPeople; */

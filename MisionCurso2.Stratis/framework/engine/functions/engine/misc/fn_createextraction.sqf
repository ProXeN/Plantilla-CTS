/* Create an extraction for the given group, spawning a vehicle at one position and pick up the group at another.
 * Parameters:
 *  _this select 0:		Group to extract, or array of units
 *  _this select 1:		Class name of extraction vehicle, or an array with a list of class names
 *  _this select 2:     Array of booleans, corresponding to the individual vehicles. True means, land, false means loiter.
 *                      If empty array, true is assumed.
 *  _this select 3:		Position to spawn at
 *  _this select 4:		Position to pick up at
 *  _this select 5:		(optional position) Position to fly to
 *  _this select 6:		(optional string) Code to run after spawning the vehicle (called once)
 *  _this select 7:		(optional string) Code to run when chopper has reached the extraction wp (called once)
 *  _this select 8:		(optional string) Code to run when group is in chopper (called once)
 *  _this select 9:     (optional string) Code to run when end point is reached (called for each vehicle)
 *
 *
 * Example:
 * Spawn an MH-9 and an AH-99. The MH-9 will land, while the AH-99
 * will provide cover (not landing).
 *
 * [_playerGroup,
 *  ["B_Heli_Light_01_F", "B_Heli_Attack_01_F"],
 *  [true, false],
 *  getMarkerPos "markSpawn",
 *  getMarkerPos "markPickup",
 *  getMarkerPos "markEnd",
 *  "hint 'spawn';",
 *  "hint 'reached';",
 *  "hint 'all in';",
 *  "hint 'end pos';"
 * ] spawn BRM_fnc_createExtraction;
 */

if (!isServer) exitWith {/* Server only */};

private ["_units", "_vehicleList", "_heliPad"];

private _group = param [0, [], [grpNull,[]]];
private _land = param [2, [], [[]]];
private _spawnPos = param [3, [0, 0, 0], [[]], [2,3]];
private _pickupPos = param [4, [0, 0, 0], [[]], [2,3]];
private _side = west;

/* Parameter 1 can be a string, or an array of strings. Convert to a
 * single-entry array if it's a string
 */
if (tolower (typename (param[1])) == "string") then
{
    _vehicleList = [param[1]];
} else {
    _vehicleList = param [1];
};

/* Parameter 0 can be either a group, or an array of individual units.
 * We extract an array of units here if it's a group
 */
if (tolower (typeName _group)  == "array") then
{
    _units = _group;
    {
        if (side _x != sideLogic) exitWith {
            _side = side _x;
        };
    } foreach _units;

} else {
    _side = side leader _group;
    _units = units _group;
};

/* Parameter 2 can be an array of booleans indicating which vehicle should stand
 * by for picking up passengers, and which vehicle should stay on guard for security.
 * If empty, we fill it with an appropriate number of 'true' values. If not empty,
 * we pad the remaining entries with copies of the last one, similar to how
 * config entry arrays work
 */
if ((count _land) != (count _vehicleList)) then {
    private _last = true;

    if (count _land != 0) then {
        _last = _land select (count _land - 1);
    };

    private _num = count _land;
    for "_i" from _num to ((count _vehicleList) - 1) do
    {
        _land = _land + [_last];
    };
};

private _endPos = param [5, _spawnPos, [[]], [2,3]];
private _afterSpawn = compile (param [6, "", [""]]);
private _wpReach = param [7, "", [""]];
private _inChopper = compile (param [8, "", [""]]);
private _endReach = param [9, "", [""]];

/* Create a list of relative positions since the spawnGroup function is to odense to figure out that two helis
 * created at the same position will kill each other
 */
private _posList = [];

for "_i" from 1 to count _vehicleList do {
    private _pos = [_spawnPos, 50, _i * (360.0 / (count _vehicleList))] call BIS_fnc_relPos;
    _pos = [(_pos select 0) - (_spawnPos select 0), (_pos select 1) - (_spawnPos select 1), _pos select 2];
    _posList = _posList + [_pos];
};

private _az = [_spawnPos, _pickupPos] call BIS_fnc_dirTo;
private _extGrps = [_spawnPos, _side, _vehicleList, _posList, _az] call {
					params ["_spawnPos", "_side", "_vehicleList", "_posList", "_az"];
					private _grps = [];

					private _i = 0;

					for "_i" from 0 to ((count _vehicleList) - 1) do
					{
						private _spawnPos = _SpawnPos vectorAdd (_posList select _i);
						private _grp = createGroup _side;
						[_spawnPos, _az, _vehicleList select _i, _grp, true] call BIS_fnc_spawnVehicle;

						_grps = _grps + [_grp];
					};

					_grps;
};

_extGrps call _afterSpawn;

private _heliPads = [];
for "_i" from 0 to ((count _extGrps) - 1) do
{
	private _heliPad = "HeliHEmpty" createVehicle (_pickupPos vectorAdd (_posList select _i));
    _heliPads = _heliPads + [_heliPad];
};


FHQ_ExtractReady = false;

/* Create waypoints for all vehicles */
private _callbackCalled = false;

for "_i" from 0 to ((count _extGrps) - 1) do
{
    private _grp = _extGrps select _i;
    private _pos = _pickupPos vectorAdd (_posList select _i);

	 _grp call compile format ["FHQ_Extract_%1 = vehicle leader _this;", _i];
	private _wp = _grp addWaypoint [_pos, 1];

    private _statement = "";

    if (_land select _i) then {
        _wp setWaypointType "MOVE";
        _statement = format ["FHQ_Extract_%1 land 'GET IN';", _i];
    } else {
        _wp setWaypointType "LOITER";
        _wp setWaypointLoiterRadius 40;
    };

    if (!_callbackCalled && (_land select _i)) then {
      	_statement = _statement + format [" %1", _wpReach];
        _callbackCalled = true;
    };

	_wp setWaypointStatements ["true", _statement];
};

/* Find the actual vehicle this group come in */
private _vehiclesInGroup = [];
{
    private _grp = _x;
    {
    	if (!(vehicle _x in _vehiclesInGroup)) then {
       	 _vehiclesInGroup = _vehiclesInGroup + [vehicle _x];
    	};
    } foreach units _grp;
} foreach _extGrps;

waitUntil {
    ({alive _x} count _units)
    ==
    ({(vehicle _x in _vehiclesInGroup) && alive _x} count _units)
};


_extGrps call _inChopper;

{
	deleteVehicle _x;
} forEach _helipads;

/* Create egress points */
for "_i" from 0 to ((count _extGrps) - 1) do
{
    private _grp = _extGrps select _i;

    while {(count (waypoints _grp)) > 0} do
	{
  		deleteWaypoint ((waypoints _grp) select 0);
 	};

	private _wp = _grp addWaypoint [_endPos vectorAdd (_posList select _i), 30];

    if (_land select _i) then {
        _wp setWaypointType "MOVE";
    } else {
        _wp setWaypointType "LOITER";
        _wp setWaypointLoiterRadius 40;
    };

   	_wp setWaypointStatements ["true", _endReach];
};

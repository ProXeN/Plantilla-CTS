/* Set up insertion of a specified group of units by another
 * group of units.
 *
 * Parameters:
 *  _this select 0:	  Group or array of units to insert
 *  _this select 1:	  Group or array of groups of units that do the insertion.
 *                    Basically, this is one or more groups of transports.
 * 					  Note that a group must only have one actual vehicle.
 *  _this select 2:	  Array of booleans corresponding to the individual insertion
 * 					  vehicles, indicating whether they should land or not. If they
 * 			 		  don't land, they will loiter. Can be empty, assuming true.
 *  _this select 3:	  Position for drop-off
 *  _this select 4:	  Egress position. Transports will fly to this position after dropping
 *                    off their troops.
 *  _this select 5:	  (optional string) Code to run when vehicles reach drop-off (called once)
 *  _this select 6:   (optional string) Code to run when group is out of vehicles (called once)
 * _ this select 7:   (optional string) Code to run when chopper reaches egress position (called for each vehicle)
 *
 * Do NOT use CTRG Helicopters. They can't land for some reason. (1.64)
 * Example:
 *
 * This assumes tow groups of transports, group1 is a transport group, group2 is a gunship escort.
 * The groups fly to markDropOff and while the transports lands to unload troops, the
 * gunship loiters.
 *
 * [_playerGroup,
 *  [group1, group2],
 *  [true, false],
 *  getMarkerPos "markDropOff",
 *  getMarkerPos "markEnd",
 *  "hint 'reached';",
 *  "hint 'all out';"
 * ] spawn FHQ_fnc_createInsertion;
 */

 if (!isServer) exitWith { /* Server only */};

 private ["_insertGroup", "_transportGroups"];

 private _land = param [2, [], [[]]];
 private _dropOffPos = param [3, [0, 0, 0], [[]], [2,3]];
 private _endPos = param [4, [0, 0, 0], [[]], [2,3]];
 private _wpReach = param [5, "", [""]];
 private _groupOut = compile param [6, "", [""]];
 private _endReach = param [7, "{ deleteVehicle _x;} foreach (crew vehicle this) + [vehicle this];", [""]];


 /* The first two parameters might be single values, or arrays.
  * For easier code, we convert both of them to arrays
  */
 if (typename (param [0, [], [grpNull,[]]]) != "ARRAY") then {
     _insertGroup = units (param [0, [], [grpNull,[]]]);
 } else {
     _insertGroup = param [0, [], [grpNull,[]]];
 };

 if (typename (param [1, [], [grpNull,[]]]) != "ARRAY") then {
     _transportGroups = [param [1, [], [grpNull,[]]]];
 } else {
     _transportGroups = param [1, [], [grpNull,[]]];
 };

/* Parameter 2 can be an array of booleans indicating which vehicle should stand
 * by for picking up passengers, and which vehicle should stay on guard for security.
 * If empty, we fill it with an appropriate number of 'true' values. If not empty,
 * we pad the remaining entries with copies of the last one, similar to how
 * config entry arrays work
 */
if ((count _land) != (count _transportGroups)) then {
    private _last = true;

    if (count _land != 0) then {
        _last = _land select (count _land - 1);
    };

    private _num = count _land;
    for "_i" from _num to ((count _transportGroups) - 1) do
    {
        _land = _land + [_last];
    };
};

/* Create a list or relative positions. We use them to assign possible landing sites. */
private _posList = [];

for "_i" from 1 to count _transportGroups do {
    private _pos = [_dropOffPos, 30, _i * (360.0 / (count _transportGroups))] call BIS_fnc_relPos;
    _pos = [(_pos select 0) - (_dropOffPos select 0), (_pos select 1) - (_dropOffPos select 1), _pos select 2];
    _posList = _posList + [_pos];
};

/* Create invisible Helipads for choppers */
private _heliPads = [];
for "_i" from 0 to ((count _transportGroups) - 1) do {
	private _heliPad = "HeliHEmpty" createVehicle (_dropOffPos vectorAdd (_posList select _i));
    _heliPads = _heliPads + [_heliPad];
};

/* Create waypoints for the different vehicles/groups */
private _callbackCalled = false;

for "_i" from 0 to ((count _transportGroups) - 1) do {
    private _grp = _transportGroups select _i;
    private _pos = _dropOffPos vectorAdd (_posList select _i);

    /* Clear existing waypoints first */
    while {(count (waypoints _grp)) > 0} do
	{
  		deleteWaypoint ((waypoints _grp) select 0);
 	};

    _grp call compile format ["FHQ_Insert_%1 = vehicle leader _this;", _i];
    private _wp = _grp addWaypoint [_pos, 1];

    private _statement = "";

    if (_land select _i) then {
        _wp setWaypointType "MOVE";
        _statement = format ["FHQ_Insert_%1 land 'GET OUT';", _i];
    } else {
        _wp setWaypointType "LOITER";
        _wp setWaypointLoiterRadius 40;
    };

    /* Attach the callback to one of the landing craft */
    if (!_callbackCalled && (_land select _i)) then {
        _statement = _statement + format[" %1", _wpReach];
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
} foreach _transportGroups;

/* Wait for the unloading troops to disembark */
waitUntil {
    0
    ==
    ({(vehicle _x in _vehiclesInGroup) && alive _x} count _insertGroup)
};

_transportGroups call _groupOut;

/* Clean up */
{
    deleteVehicle _x;
} forEAch _helipads;

/* Create egress points */
for "_i" from 0 to ((count _transportGroups) - 1) do
{
    private _grp = _transportGroups select _i;

    while {(count (waypoints _grp)) > 0} do
	{
  		deleteWaypoint ((waypoints _grp) select 0);
 	};

	private _wp = _grp addWaypoint [_endPos vectorAdd (_posList select _i), 40];

    _wp setWaypointType "MOVE";
  	_wp setWaypointStatements ["true", _endReach];

    if (!(_land select _i)) then {
    	_wp = _grp addWaypoint [_endPos vectorAdd (_posList select _i), 40];
    	_wp setWaypointType "LOITER";
    	_wp setWaypointLoiterRadius 40;
    };
};

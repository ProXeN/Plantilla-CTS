// F2 - Casualties Cap
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

if (isServer) then {

// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_grps","_pc","_end","_started","_remaining","_grpstemp","_alive","_faction","_temp_grp","_temp_grp2","_type"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:
_grpstemp = _this select 0;
_pc = _this select 1;
_end = _this select 2;
_faction = _this select 3;
_started = 0;

// ====================================================================================

// Check if _grpstemp is a variable of type SIDE otherwise continue.
_type = typeName _grpstemp; // Grab the type name

if(_type == "SIDE") then // if the variable is any of the side variables use it to consturct a list of groups in that faction.
{
	_temp_grp = [];
	{
		if((side _x == _grpstemp) && (leader _x in playableUnits)) then
		{
			_temp_grp = _temp_grp + [_x]; // Add group to array

		};

	} forEach allGroups;
	if(!isnil "_faction") then
	{
		_temp_grp2 = [];
		{
			if(faction (leader _x) in _faction) then
			{
				_temp_grp2 = _temp_grp2 + [_x];
			};
		} forEach _temp_grp;
		_temp_grp = _temp_grp2;
	};
	_grpstemp = _temp_grp; // set it.
};

// ====================================================================================

// CLEAN OUT EMPTY GROUPS
// 10 seconds into the mission, we cycle through _grpstemp and only add valid groups
// to _grps:

sleep 10;

_grps = [];

_grps = _grpstemp select {
	_y = _x;
	_alive = {alive _x} count (units _x);
	_alive >= 1 && !(isNull _x);
};

// ====================================================================================

// CREATE STARTING VALUES
// A count is made of units in the groups listed in _grps.

{_started = _started + (count (units _x))} forEach _grps;

// ====================================================================================

// CHECK IF CASUALTIES CAP HAS BEEN REACHED OR EXCEEDED
// Every 6 seconds the server will check to see if the number of casualties sustained
// within the group(s) has reached the percentage specificed in the variable _pc. If
// the cap has been reached, the ending specified in _end will be triggered, using the
// Multiplayer Ending Controller component.

while {true} do
	{
	    _remaining = 0;

	    {_remaining = _remaining + ({alive _x} count (units _x)) } forEach _grps;

	    if (_remaining == 0) exitWith
	    {
	        [_end] call BRM_fnc_callEnding;
	    };
	    if (((_started - _remaining) / _started) >= (_pc / 100)) exitWith
	    {
	        [_end] call BRM_fnc_callEnding;
	    };
	    sleep 10;
	};
};

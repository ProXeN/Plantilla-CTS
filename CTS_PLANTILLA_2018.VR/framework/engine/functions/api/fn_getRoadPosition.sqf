/* Get a random position on a piece of road in a given radius */
private _pos = [_this, 0] call BIS_fnc_param;
private _radius = [_this, 1] call BIS_fnc_param;

private _roads = _pos nearRoads _radius;

private _select = _roads call BIS_fnc_selectRandom;

_res = getPos _select;
_res;
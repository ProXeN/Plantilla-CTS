/*
================================================================================

NAME:
    BRM_fnc_readExtraction

AUTHOR(s):
    Nife

DESCRIPTION:
    Reads all the extraction points in the map and marks them properly.

PARAMETERS:
    None.

USAGE:
    [] call BRM_fnc_readExtraction

RETURNS:
    Nothing.

================================================================================
*/

if (!isServer) exitWith {};

extraction_points_blu = [];
extraction_points_op = [];
extraction_points_ind = [];
extraction_points_civ = [];

{
_pos = missionNamespace getVariable [_x, objNull];
extraction_points_blu pushBack _pos;
} forEach mission_extraction_points_a;

{
_pos = missionNamespace getVariable [_x, objNull];
extraction_points_op pushBack _pos;
} forEach mission_extraction_points_b;

{
_pos = missionNamespace getVariable [_x, objNull];
extraction_points_ind pushBack _pos;
} forEach mission_extraction_points_c;

extraction_a = [];
extraction_b = [];
extraction_c = [];

switch (side_a_side) do {
    case WEST: { extraction_a pushBack mission_extraction_BLU; extraction_a pushBack extraction_points_blu };
    case EAST: { extraction_a pushBack mission_extraction_OP; extraction_a pushBack extraction_points_op };
    case RESISTANCE: { extraction_a pushBack mission_extraction_IND; extraction_a pushBack extraction_points_ind };
};

switch (side_b_side) do {
    case WEST: { extraction_b pushBack mission_extraction_BLU; extraction_b pushBack extraction_points_blu };
    case EAST: { extraction_b pushBack mission_extraction_OP; extraction_b pushBack extraction_points_op };
    case RESISTANCE: { extraction_b pushBack mission_extraction_IND; extraction_b pushBack extraction_points_ind };
};

switch (side_c_side) do {
    case WEST: { extraction_c pushBack mission_extraction_BLU; extraction_c pushBack extraction_points_blu };
    case EAST: { extraction_c pushBack mission_extraction_OP; extraction_c pushBack extraction_points_op };
    case RESISTANCE: { extraction_c pushBack mission_extraction_IND; extraction_c pushBack extraction_points_ind };
};

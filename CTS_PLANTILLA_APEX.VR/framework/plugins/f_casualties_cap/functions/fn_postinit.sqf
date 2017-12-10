
if (!isMultiplayer) exitWith {};
if (!isServer) exitWith {};
if (mission_cas_cap == -1) exitWith {};

#include "includes\settings.sqf"

private ["_casA","_casB","_casC", "_casBLU", "_casOP", "_casIND"];

call compile format ["_casBLU = %1", casualty_group_BLU];
call compile format ["_casOP = %1", casualty_group_OP];
call compile format ["_casIND = %1", casualty_group_IND];

switch (side_a_side) do {
    case WEST: { _casA = _casBLU };
    case EAST: { _casA = _casOP };
    case RESISTANCE: { _casA = _casIND };
};

switch (side_b_side) do {
    case WEST: { _casB = _casBLU };
    case EAST: { _casB = _casOP };
    case RESISTANCE: { _casB = _casIND };
};

switch (side_c_side) do {
    case WEST: { _casC = _casBLU };
    case EAST: { _casC = _casOP };
    case RESISTANCE: { _casC = _casIND };
};

[_casA, mission_cas_cap, endings_defeat] spawn f_cas_cap_fnc_CasualtiesCapCheck;

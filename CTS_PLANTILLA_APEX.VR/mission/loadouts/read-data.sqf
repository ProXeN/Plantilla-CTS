
// =============================================================================
// Includes the loadout sheets.

#include "faction-list.sqf"

// =============================================================================

_factionVehicles = _factionVehicles call BRM_fnc_setVehiclesArray;

// =============================================================================
// Include the faction structure, including hierarchy and medical equipment.

if (_assignLoadoutMode) then {
    if (_UAVBAg == "auto") then { _UAVBag = (([_unit, "vanilla"] call BRM_fnc_getSideUAV) select 0) };
    if (_UAVTerminal == "auto") then { _UAVTerminal = (([_unit, "vanilla"] call BRM_fnc_getSideUAV) select 1) };

    #include "structure-list.sqf"

};
// =============================================================================

// INCLUDE DEFAULT VALUES ======================================================

#include "includes\default-values.sqf"

// =============================================================================

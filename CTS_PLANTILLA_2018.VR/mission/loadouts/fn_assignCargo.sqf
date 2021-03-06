// ============================================================================================
//
//	This script allows for loading of cargo into any type of vehicle that is placed in the editor.
//
// ============================================================================================

if (isServer) then {
[{!(isNil "mission_settings_loaded")}, {
[{((pluginsLoaded) && (!isNull (_this select 0)))}, {

    params ["_object", "_faction", "_type"];

    _unit = _object;
    if (typeName _type != "ARRAY") then { _type = [_type] };

    _isLeader = false;
    _isMan = _unit isKindOf "Man";
    if (_isMan) then {
        _isLeader = isFormationLeader _unit;
    };

    _initialized = _object getVariable ["unit_initialized", false];
    if (_initialized) exitWith {};

    #include "includes\private-variables.sqf"
    #include "includes\faction-info-index.sqf"
    #include "includes\clear-object.sqf"
    #include "content\content-list.sqf"
    #include "includes\get-faction.sqf"

    _assignLoadoutMode = false;

    // READ LOADOUT DATA =======================================================

    #include "read-data.sqf"

    // =========================================================================
    // Include the Cargo types.

    {
      #include "cargo-list.sqf"
    } forEach _type;

    // =========================================================================

    _object setVariable ["unit_initialized", true, true];

    // =========================================================================

}, _this] call CBA_fnc_waitUntilAndExecute;
}, _this] call CBA_fnc_waitUntilAndExecute;
};
// ============================================================================================

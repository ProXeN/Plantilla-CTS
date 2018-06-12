
[{!(isNil "mission_settings_loaded")}, {
[{(pluginsLoaded)}, {
    _unit = _this select 0;
    _faction = _this select 1;
    _type = "";

    _isLeader = false;
    _isMan = _unit isKindOf "Man";
    if (_isMan) then {
        _isLeader = isFormationLeader _unit;
    };

    if (!_isMan) exitWith {};
    if (!(local _unit)) exitWith {};

    #include "includes\private-variables.sqf"
    #include "includes\faction-info-index.sqf"
    #include "includes\get-faction.sqf"

    _unit setVariable ["BIS_enableRandomization", false];

    // RESETS ITEMS ============================================================

    #include "includes\clear-object.sqf"

    // DETERMINE UNIT TYPE =====================================================

    #include "includes\get-type.sqf"

    // CLASSES =================================================================

    #include "includes\classes-list.sqf"

    // ASSIGN LOADOUTS BASED ON FACTION ========================================

    _assignLoadoutMode = true;

    #include "content\content-list.sqf"

    // READ LOADOUT DATA =======================================================

    #include "read-data.sqf"

    // SET IDENTITY ============================================================

    #include "includes\set-identity.sqf"

    // =========================================================================

}, _this] call CBA_fnc_waitUntilAndExecute;
}, _this] call CBA_fnc_waitUntilAndExecute;
// ============================================================================================

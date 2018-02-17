/*
================================================================================

NAME:
    BRM_fnc_initPlayer

AUTHOR(s):
    Nife

DESCRIPTION:
    Function called by the player to initialize itself.

PARAMETERS:
    None. All parameters are taken from the unit's "unitInit" object variable.

USAGE:
    [] call BRM_fnc_initPlayer

RETURNS:
    Nothing.

================================================================================
*/

// Waits until initialization is safe. =========================================

if (!hasInterface) exitWith {};
finishMissionInit;
waitUntil { player == player && !isNull player };

_playerLog = format ["INITIALIZING PLAYER '%1' (%2)", name player, player];
["LOCAL", "F_LOG", _playerLog] call BRM_fnc_doLog;
["SERVER", "F_LOG", _playerLog] call BRM_fnc_doLog;

// Assigns JIP status. =========================================================

player_is_jip = didJIP;

["LOCAL", "F_LOG", format ["JIP STATUS: %1 | TIME: %2", player_is_jip, time]] call BRM_fnc_doLog;

player_is_spectator = (player getVariable ["is_spectator", false]);

if ((!mission_allow_jip) && player_is_jip && (!player_is_spectator)) exitWith {
    [player] spawn BRM_fnc_removeJIP;
    player setVariable ["unit_initialized", true, true];
};

// Mute orders and reports. ===================================================

enableSentences false;

// Removes spectators from the game. ===========================================

if (player_is_spectator) exitWith {};

// Checks if player hasn't already been initialized. ===========================

_initialized = player getVariable ["unit_initialized",false];

if (_initialized) exitWith {};

private["_faction","_role"];

// Reads player's init line. ===================================================

(player getVariable ["unitInit", ["MAIN", "*", "*", "*"]]) params ["_groupColor", "_faction", "_role", "_groupName"];

// Adds player to relevant lists and registers its original side. ==============

mission_players pushBack player; publicVariable "mission_players";

// Reads player faction and assigns the unit loadout. ==========================

_faction = side_a_faction;

private _aliasAUTO = ["*", "AUTO", "ANY"];
private _aliasNONE = ["-", "NONE", "VANILLA"];

if (toUpper(_faction) in _aliasAUTO) then {
    _faction = side_a_faction;
};

if (toUpper(_role) in _aliasAUTO) then {
    _role = typeOf player;
};

if ((!(_faction in _aliasNONE)) && (!units_player_useVanillaGear)) then {
    [player, _faction, _role] call BRM_fnc_assignLoadout;
};

// Holster player's weapon. ====================================================

[player] spawn BRM_fnc_weaponAway;

// Assigns alias to other units and groups. ====================================

if (player_is_jip) then {
    [player, _groupName, _role] call BRM_fnc_setAlias;
};

// Adds Event Handlers with pre-configured functions. ==========================

player addEventHandler ["Respawn", BRM_fnc_onPlayerRespawn];
player addEventHandler ["Hit", {(_this select 0)setVariable["last_damage",(_this select 1)]}];
player addEventHandler ["Killed", BRM_fnc_onPlayerKilled];

// Changes the player's assigned color within its group. =======================

[toUpper _groupColor] spawn {
    params ["_color"];
    private _nColor = if (_color == "WHITE") then { "MAIN" } else { _color };

    sleep 5;
    player assignTeam _nColor;
};

// Finishes initialization sequence. ===========================================

["LOCAL", "F_LOG", "PLAYER INITIALIZED"] call BRM_fnc_doLog;

player setVariable ["unit_initialized", true, true];

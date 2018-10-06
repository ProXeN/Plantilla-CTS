// Reads player faction and assigns the unit loadout. ==========================
    titleText ["", "BLACK OUT", 1];

    _initUnit = player getVariable ["unitInit", ["white", "*", "*", "*", "*"]];
    _aliasAUTO = ["*","AUTO","ANY"];
    _aliasNONE = ["-","NONE","VANILLA"];
    _faction = _initUnit select 1;
    _role = _initUnit select 2;

    if (toUpper(_faction) in _aliasAUTO) then {
        _faction = [(side player), "faction"] call BRM_fnc_getSideInfo;
    };

    if (toUpper(_role) in _aliasAUTO) then {
        _role = typeOf player;
    };

    if ((!(_faction in _aliasNONE)) && (!units_player_useVanillaGear)) then {
        [player, _faction, _role] call BRM_fnc_assignLoadout;
    };

    playSound "cambiarRopa";

    [{titleText ["", "BLACK IN", 1]}, [], 3] call CBA_fnc_waitAndExecute;
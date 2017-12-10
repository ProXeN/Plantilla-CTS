if (!isMultiplayer) then {mission_enable_hc = false};
if (mission_enable_hc && (isServer || hasInterface)) then { mission_AI_controller = false };
if (!mission_enable_hc && !isServer) then { mission_AI_controller = false };

if (!mission_enable_hc && isServer) then { mission_AI_controller = true;};
if (mission_enable_hc && (!isServer && !hasInterface)) then { mission_AI_controller = true;};

if (mission_AI_controller) then {
    if (isServer) then { mission_AI_controller_name = "SERVER" }
    else {
        if (hasInterface) then {
            mission_AI_controller_name = name player;
        } else {
            mission_AI_controller_name = player;
        };
    };

    publicVariable "mission_AI_controller_name";
};

0 spawn {
    waitUntil {!(isNil "mission_AI_controller_name")};
    ["LOCAL","CHAT", format ["AI Controller is currently enabled as %1.", mission_AI_controller_name]] call BRM_fnc_doLog;
    //PASAR IA DEL EDITOR AL HC
    if (isMultiplayer && isServer) then {
      sleep 0.1;
      if (isNull Headless_Client) exitWith {};
        private _hcid = owner Headless_Client;
      {
        private _isOnHC = (groupOwner _x) == _hcid;
        private _moved = false;
        private _noMove = _x getVariable ["PRX_HC_NOMOVE", false];
          {
                if (_x getVariable ["PRX_HC_NOMOVE", false]) then {
                    _noMove = true;
                };
          } foreach units _x;

        diag_log format ["group %4, %1 %2 %3", !isPlayer (leader _x), !_isOnHC, !_noMove, _x];
      	if (!isPlayer (leader _x) && !_isOnHC && !_noMove) then {
         	diag_log format ["Moving %1 to %2", _x, _hcid];
          if (groupOwner _x != _hcid) then {
         		_x setGroupOwner _hcid;
          } else {
              _moved = true;
          };
        };
          diag_log format ["moved %1", _moved];
      } forEach allGroups;
    };
};




/*if (mission_AI_controller) then {
    #include "includes\core_functions.sqf"
    [] call hc_fnc_loadMissionObjects;
};*/

//Define Terminal
_terminal = _this select 0;
//Sound
_codeProgress = {
  private _progressTick = _this select 4;
  if (_progressTick % 2 == 0) exitwith {};
  playsound3d [((getarray (configfile >> "CfgSounds" >> "Orange_Action_Wheel" >> "sound")) param [0,""]) + ".wss",player,false,getposasl player,1,0.9 + 0.2 * _progressTick / 24];
};
//Define Terminal Colors
[_terminal,"red","orange","green"] remoteExec ["BIS_fnc_dataTerminalColor", [0,-2] select isDedicated, true];
//Add Hold Action
[
_terminal,              /* 0: Target */
"Interceptar Comunicaciones", 		      /* 1: Title */
"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_connect_ca.paa",     /* 2: idleIcon */
"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_connect_ca.paa",     /* 3: progressIcon */
"_this distance _target < 3",  /* 4: CondShow */
"_caller distance _target < 3",/* 5: codeProgress */
{[_this select 0,3] call BIS_fnc_dataTerminalAnimate;},                       /* 6: codeStart */
_codeProgress,                       /* 7: codeTick */
{"mission\custom-scripts\scripts\download\progress.sqf" remoteExec ["execVM", 0, false]; [(_this select 0),(_this select 2)] remoteExec ["bis_fnc_holdActionRemove",[0,-2] select isDedicated,true];},    /* 8: codeCompleted */
{[_this select 0,0] call BIS_fnc_dataTerminalAnimate;},                        /* 9: codeInterrupted */
[],                        /* 10: Arguments */
3,                        /* 11: Duration */
10,                        /* 12: priority */
true,                    /* 13: Remove on completion */
false                    /* 14: Show if unconcious */
] remoteExec ["BIS_fnc_holdActionAdd",[0,-2] select isDedicated,true];

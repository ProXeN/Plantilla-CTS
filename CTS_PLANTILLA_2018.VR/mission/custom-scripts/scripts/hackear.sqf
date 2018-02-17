//Define Terminal
_terminal = _this select 0;
_codeProgress = {
  private _progressTick = _this select 4;
  if (_progressTick % 2 == 0) exitwith {};
  playsound3d [((getarray (configfile >> "CfgSounds" >> "Orange_Action_Wheel" >> "sound")) param [0,""]) + ".wss",player,false,getposasl player,1,0.9 + 0.2 * _progressTick / 24];
};

//Add Hold Action
[
_terminal,              /* 0: Target */
"Hackear Dispositivo", 		      /* 1: Title */
"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_hack_ca.paa",     /* 2: idleIcon */
"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_hack_ca.paa",     /* 3: progressIcon */
"_this distance _target < 3",  /* 4: CondShow */
"_caller distance _target < 3",/* 5: codeProgress */
{},                       /* 6: codeStart */
_codeProgress,                       /* 7: codeTick */
{["taskHack","succeeded"] remoteExec ["FHQ_fnc_ttSetTaskState", 2];[(_this select 0),(_this select 2)] remoteExec ["bis_fnc_holdActionRemove",[0,-2] select isDedicated,true];},    /* 8: codeCompleted */
{},                        /* 9: codeInterrupted */
[],                        /* 10: Arguments */
3,                        /* 11: Duration */
10,                        /* 12: priority */
true,                    /* 13: Remove on completion */
false                    /* 14: Show if unconcious */
] remoteExec ["BIS_fnc_holdActionAdd",[0,-2] select isDedicated,true];

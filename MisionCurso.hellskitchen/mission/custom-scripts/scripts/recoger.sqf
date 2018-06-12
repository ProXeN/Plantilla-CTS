params ["_item"];
//Interacción Contacto
[
_item,              /* 0: Target */
"Recoger", 		      /* 1: Title */
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",     /* 2: idleIcon */
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",     /* 3: progressIcon */
"_this distance _target < 3",  /* 4: CondShow */
"_caller distance _target < 3",/* 5: codeProgress */
{},                       /* 6: codeStart */
{},                       /* 7: codeTick */
{[(_this select 0),(_this select 2)] remoteExec ["bis_fnc_holdActionRemove",[0,-2] select isDedicated,true]; deletevehicle (_this select 0)},    /* 8: codeCompleted */
{},                        /* 9: codeInterrupted */
[],                        /* 10: Arguments */
1,                        /* 11: Duration */
10,                        /* 12: priority */
true,                    /* 13: Remove on completion */
false                    /* 14: Show if unconcious */
] remoteExec ["BIS_fnc_holdActionAdd",[0,-2] select isDedicated,true];

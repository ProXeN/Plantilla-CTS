_npc = _this select 0;

//Interacción Contacto
[
_npc,              /* 0: Target */
"Hablar", 		      /* 1: Title */
"\CTS_assets\actions\talk.paa",     /* 2: idleIcon */
"\CTS_assets\actions\talk.paa",     /* 3: progressIcon */
"_this distance _target < 3",  /* 4: CondShow */
"_caller distance _target < 3",/* 5: codeProgress */
{},                       /* 6: codeStart */
{},                       /* 7: codeTick */
{[(_this select 0),(_this select 2)] remoteExec ["bis_fnc_holdActionRemove",[0,-2] select isDedicated,true]; remoteExec ["CTS_Saludo",[0,-2] select isDedicated]},    /* 8: codeCompleted */
{},                        /* 9: codeInterrupted */
[],                        /* 10: Arguments */
1,                        /* 11: Duration */
10,                        /* 12: priority */
true,                    /* 13: Remove on completion */
false                    /* 14: Show if unconcious */
] remoteExec ["BIS_fnc_holdActionAdd",[0,-2] select isDedicated,true];

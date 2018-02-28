// Set AI Hostage Script
// By Galactic Twinkles
// Define Captive
_captive = _this select 0;
// Select random animation
_anim = selectRandom ["Acts_AidlPsitMstpSsurWnonDnon01","Acts_AidlPsitMstpSsurWnonDnon02","Acts_AidlPsitMstpSsurWnonDnon03","Acts_AidlPsitMstpSsurWnonDnon04","Acts_AidlPsitMstpSsurWnonDnon05","Acts_ExecutionVictim_Loop"];

// Set Captive Settings
_captive setCaptive true;
// Remove Items
removeAllWeapons _captive;
removeBackpack _captive;
removeVest _captive;
removeAllAssignedItems _captive;
removeHeadgear _captive;

waitUntil {time > 30};
_captive switchMove _anim; // SwitchMove to random animation
// Set unit as hurt if it's the Execution animation
if (_anim == "Acts_ExecutionVictim_Loop") then {
	_captive setDamage .5;
};
_captive disableAI "MOVE"; // Disable AI Movement
_captive disableAI "AUTOTARGET"; // Disable AI Autotarget
_captive disableAI "ANIM"; // Disable AI Behavioural Scripts
_captive allowFleeing 0; // Disable AI Fleeing
_captive setBehaviour "Careless"; // Set Behaviour to Careless because, you know, ARMA AI.

// Add Hold Action to Free Hostage
[
/* 0 object */				        _captive,
/* 1 action title */				"Rescatar Rehen",
/* 2 idle icon */				"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",
/* 3 progress icon */				"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",
/* 4 condition to show */			"_this distance _target < 3",
/* 5 condition for action */			"true",
/* 6 code executed on start */			{},
/* 7 code executed per tick */			{},
/* 8 code executed on completion */      	{
						        if (_this select 3 select 0 == "Acts_ExecutionVictim_Loop") then {
								[_this select 0, "Acts_ExecutionVictim_Unbow"] remoteExec ["playMove", 2];
							} else {
								[_this select 0, "Acts_AidlPsitMstpSsurWnonDnon_out"] remoteExec ["playMove", 2];
							};
							_complMessage = selectRandom ["Pensaba que iba a morir aquí...","Os lo agradezco.","Creo que me he cagado encima.","Sacadme de aquí de una vez.","Joder ¿Por qué habéis tardado tanto?","Rápido, vámonos."];
							[name (_this select 0), _complMessage] remoteExec ["BIS_fnc_showSubtitle"];
							sleep 5.5;
							(_this select 0) enableAI "MOVE";
							(_this select 0) enableAI "AUTOTARGET";
							(_this select 0) enableAI "ANIM";
							(_this select 0) setBehaviour "SAFE";
							[(_this select 0)] joinSilent player;
							[(_this select 0),(_this select 2)] remoteExec ["bis_fnc_holdActionRemove", 0, true];
							["taskRescue","succeeded"] remoteExec ["FHQ_fnc_ttSetTaskState", 2]
						},
/* 9 code executed on interruption */       {
						_intrMessage = selectRandom ["¡No me dejéis aquí!","¡Eh, no te vayas!","¡Me matarán si me dejas aquí!","Joder, joder, joder..."];
						["Hostage", _intrMessage] remoteExec ["BIS_fnc_showSubtitle"];
					    },
/* 10 arguments */			    [_anim],
/* 11 action duration */		    3,
/* 12 priority */			    10,
/* 13 remove on completion */		    true,
/* 14 show unconscious */		    false
] remoteExec ["BIS_fnc_holdActionAdd", 0, true];

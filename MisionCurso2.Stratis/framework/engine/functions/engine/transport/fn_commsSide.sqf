params ["_speaker","_text"];

_target = [0, -2] select isMultiplayer;
[[[_speaker,_text]],"SIDE",0.10] remoteExec ["BRM_fnc_simpleConv",_target,false];

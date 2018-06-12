private _timeToShow = param [0, 4, [0]];
private _width = param [1, 1024, [0]];
private _height = param [2, 128, [0]];


private _camera = "camera" camCreate [0,0,2];
_camera camPrepareTarget [-50419.49,-4203.23,86250.00];
_camera camCommitPrepared 0;
_camera cameraEffect ["internal", "BACK"];

100011 cutrsc ["RscQuoteDialog", "BLACK"];
sleep 1;
waitUntil {
	!isNil {uinamespace getvariable "fhq_RscQuoteDialog"};
};

private _pW = pixelW * _width;
private _pH = pixelH * _height;

disableSerialization;

private _display = uinamespace getvariable "fhq_RscQuoteDialog";
_display displayAddEventHandler ["unload", {uinamespace setVariable ["fhq_RscQuoteDialog", objNull];}];

private _ctrl = _display displayCtrl 1201;

// Set up in the middle of the screen
private _centerX = safeZoneX + 0.5*safeZoneW;
private _centerY = safeZoneY + 0.5*safeZoneH;

private _missionDisplay = call BIS_fnc_displayMission;
private _skipEH = _missionDisplay displayAddEventHandler [
    "KeyDown",
    {
        private _res = false;
        if (_this select 1 == 57) then {
            (call BIS_fnc_displayMission) displayRemoveEventHandler [	
            	"KeyDown", 
                uiNameSpace getVariable "FHQ_Quote_SkipEH"
            ];
            uiNameSpace setVariable ["FHQ_Quote_SkipEH", nil];
            playSound ["click", true];
            uiNameSpace setVariable ["fhq_quote_break", true];
            _res = true; 
        };
        _res
    }
];
uiNameSpace setVariable ["FHQ_Quote_SkipEH", _skipEH];

_ctrl ctrlSetFade 1; _ctrl ctrlCommit 0; // completely invisible

_ctrl ctrlSetPosition [_centerX - (_pW*0.8)/2, _centerY - (_pH*0.8)/2, _pW*0.8, _pH*0.8];
_ctrl ctrlCommit 0;

_ctrl ctrlSetFade 0;
_ctrl ctrlCommit 2;

_ctrl ctrlSetPosition [_centerX - (_pW*1.2)/2, _centerY - (_pH*1.2)/2, _pW*1.2, _pH*1.2];
_ctrl ctrlCommit 4+_timeToShow+4;


// calculate the size after the quote is fully visible and time has elapsed
private _startTime = time;
while {_startTime + _timeToShow + 4 > time} do {
    
    if (!isNil {uiNameSpace getVariable "fhq_quote_break"}) exitWith {
		uiNameSpace setVariable ["fhq_quote_break", nil];
	};
    sleep 0.5; 
    
};
//sleep _timeToShow;

_ctrl ctrlSetFade 1;
_ctrl ctrlCommit 3;
sleep 3;

_camera cameraEffect ["Terminate", "BACK"];
sleep 1;

if (!isnil {uiNameSpace getVariable "FHQ_Quote_SkipEH"}) then {
	(call BIS_fnc_displayMission) displayRemoveEventHandler [	
		"KeyDown", 
		uiNameSpace getVariable "FHQ_Quote_SkipEH"
	];
};
uiNameSpace setVariable ["fhq_quote_break", nil];
uiNameSpace setVariable ["FHQ_Quote_SkipEH", nil];

100011 cutfadeout 0;
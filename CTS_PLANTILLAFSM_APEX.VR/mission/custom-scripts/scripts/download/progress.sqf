_countdown = 20;
if (hasInterface) then {
	5 cutRsc ["MyProgressBar","PLAIN"];

	disableSerialization;
	[ "TIMER", "onEachFrame", {
		params[ "_start", "_end" ];
		_progress = linearConversion[ _start, _end, time, 0, 1 ];
		_ui = uiNamespace getVariable "PBarProgress";
		_progressBar = _ui displayCtrl 37202;
		_progressText = _ui displayCtrl 37203;
		_progressBar progressSetPosition _progress;
		_progressText ctrlsetText format["%1%2 - 100Gb", round(100*_progress), "Gb"];
		
		if ( _progress > 1 ) then {
			[ "TIMER", "onEachFrame" ] call BIS_fnc_removeStackedEventHandler;
			5 cutFadeOut 2; 
		};
	}, [ time, time + _countdown ] ] call BIS_fnc_addStackedEventHandler;
};

if (isServer) then {
	[_countdown] spawn {
		params ["_countdown"];
		sleep _countdown + 5;
		CommsCompleted = true;
	};
};


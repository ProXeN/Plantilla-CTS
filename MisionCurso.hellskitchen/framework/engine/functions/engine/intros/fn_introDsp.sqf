/*
** Intro Ticker Tape
**
** Parameter:
** 0: Time that the display should be shown
** 1: Array of text lines (up to 4) to display, can contain markup
** 2: (optional) Top Y coordinate of the display, defaults to just below top of screen, or position array
** 3: (optional) Array of two strings to attach at each start and end of each line
**
** Remarks:
** Empty line in the array are not shown. The first line is double height for a title,
** if you don't want a title pass an empty string. This applies to the maximum of 4 lines.
** Empty lines will move the ones below up, so if you want a spacing pass a single space.
**
*/
disableSerialization;

#define TICKERTIME 0.7

private _displayTimeout = param [0, 8, [0]];
private _lines = param [1, [], [[]], [0,1,2,3,4]];
private _newPos = param [2, safeZoneY, [0,[]]];
private _presuf = param [3, ["",""], [[]], [2]];

private _timeStringF = {
	private _date = date;
	private _sec = floor(time)%60;
	private _seconds = format ["%1", _sec];
	if (_sec < 10) then {
	    _seconds = format ["0%1", _sec];
	};
	private _minutes = format ["%1", _date select 4];
	if ((_date select 4) < 9) then {
		_minutes = format ["0%1",  _date select 4];
	};
	private _timeString = format ["%1:%2:%3", _date select 3, _minutes, _seconds]; 
	_timeString
};


100011 cutrsc ["RscIntroDialog", "PLAIN", 1, true];
sleep 1;

waitUntil {
	!isNil {uinamespace getvariable "fhq_RscIntroDialog"};
};

private _display = uinamespace getvariable "fhq_RscIntroDialog";
_display displayAddEventHandler ["unload", {uinamespace setVariable ["fhq_RscIntroDialog", objNull];}];

private _topY = 0;
private _topX = safeZoneX;

if (typeName _newPos == typeName []) then {
	_topX = _newPos select 0;
	_topY = _newPos select 1;
} else {
	_topY = _newPos;
};

// Go through the lines array, and set up the controls
private _y = _topY;
private _idc = 1201;
private _staticTime = call _timeStringF;
private "_fuzzy";

if (!isNil "FHQ_fnc_time2FuzzyString") then {
	_fuzzy = [daytime, "", ""] call FHQ_fnc_time2FuzzyString;
} else {
	private _dt = daytime;
	if (_dt < 4) then {
		_fuzzy = "Night";
	};
	if (_dt >= 4 && _dt < 13) then 
	{
		_fuzzy = "Morning";
	};
	if (_dt >= 13 && _dt < 18) then 
	{
		_fuzzy = "Afternoon";
	};
	if (_dt >= 18) then {
		_fuzzy = "Evening";
	};
};

playSound ["TickerBeeps", true];
{
	if (count _x > 0) then {
		private "_text";
		private _ts = call _timeStringF;
		
		
		private _ctrl = _display displayCtrl _idc;
		
		if (_idc == 1201) then {
			_text = parseText format [(_presuf select 0) + _x + (_presuf select 1), _ts, _fuzzy, _staticTime];
		} else {
			_text = parseText format [(_presuf select 0) + "<t size='0.5'>" + _x + "</t>" + (_presuf select 1), _ts, _fuzzy, _staticTime];
		};
		
		_ctrl ctrlSetFade 1; _ctrl ctrlCommit 0; // Make it invisible
		_ctrl ctrlSetStructuredText _text;
		private _pos = ctrlPosition _ctrl;
		// Set the control wide
		_ctrl ctrlSetPosition [_topX, _y, safeZoneW, (_pos select 3)];
		_ctrl ctrlCommit 0;
		private _h = ctrlTextHeight _ctrl;
		private _inc = safeZoneW;
		private _w = safeZoneW;
		while {_inc > 2} do {
			_inc = _inc / 2;
			if ((ctrlTextHeight _ctrl) > _h) then 
			{
				// Too small, increase
				_w = _w + _inc;
			} else {
				_w = _w - _inc; 
			};
			_ctrl ctrlSetPosition [_topX, _y, _w, _h]; _ctrl ctrlCommit 0;
		};
		// _w now is the real text width
		_ctrl ctrlSetPosition[_topX, _y, 0, _h]; _ctrl ctrlSetFade 0;  _ctrl ctrlCommit 0;
		_ctrl ctrlSetPosition[_topX, _y, _w, _h]; _ctrl ctrlCommit TICKERTIME;
		_y = _y + _h;
	};
	_idc = _idc + 1;
		
} forEach _lines;


private _endTime = time + _displayTimeout;
while {time < _endTime} do {
	sleep 0.5;
	private _idc = 1201;
	{
	
		if (count _x > 0) then {
			private "_text";
			private _ts = call _timeStringF;
			
			private _ctrl = _display displayCtrl _idc;
			
			if (_idc == 1201) then {
				_text = parseText format [(_presuf select 0) + _x + (_presuf select 1), _ts, _fuzzy, _staticTime];
			} else {
				_text = parseText format [(_presuf select 0) + "<t size='0.5'>" + _x + "</t>" + (_presuf select 1), _ts, _fuzzy, _staticTime];
			};
			
			_ctrl ctrlSetStructuredText _text; _ctrl ctrlCommit 0;

			
		};
		_idc = _idc + 1;		
	} forEach _lines;
};
	

100011 cutfadeout 1;
sleep 2;
100012 cutfadeout 1;
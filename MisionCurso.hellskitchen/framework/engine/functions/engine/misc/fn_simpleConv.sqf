/*
	Author: Revo, _fnc_showTubtitles from Thomas Ryan, edited by Revo
	Last update:  08/21/2016
	- added option for background

	Description:
	Displays a subtitle at the bottom of the screen. Name of the speaker can be defined and it's colour

	Parameters:
	_this select 0: _array
		_array select 0: STRING - Name of the person speaking - Default: Speaker
		_array select 1: STRING - Subtitle - Default: Subtitle
		_array select 2: OBJECT - Character which speaks the subtitle, used to enable lip movement - Default: objNull
	_this select 1: STRING - Chat type - Default: SIDE
						   - SIDE
						   - GLOBAL
						   - VEHICLE
						   - COMMAND
						   - GROUP
						   - DIRECT
						   - CUSTOM
						   - SYSTEM
	_this select 2: NUMBER - Break multiplier - Is used to calculate the display length of every line - Default: 0.1
	_this select 3: BOOL   - Show background

	Returns:
	true

	Example:

	line1 = ["Sgt. Anderson", "Papa Bear, this is Alpha 1-1, we are under heavy fire, I repeat, we are under heavy fire, how copy?"];
	line2 = ["PAPA BEAR", "Solid copy Alpha 1-1, we are sending air support, mark the enemy's position with red smoke, Papa Bear out."];
	[[line1,line2],"SIDE",0.15,true] execVM "fn_simpleConv.sqf";

*/

waitUntil {isNil "Revo_fnc_simpleConversation_running"};
Revo_fnc_simpleConversation_running = true;

private _lines = param [0,[["Speaker","Subtitle"]],[[]]];
private _colour = param [1,"SIDE",[""]];
private _breakMultiplier = param [2,0.1,[0]];

//Select HEX colour from given string
private _colourHTML = switch (toUpper _colour) do
{
    case "SIDE": 	{"#00ccff"};
    case "GLOBAL": 	{"#d7d7d9"};
    case "VEHICLE": {"#fbd40b"};
    case "COMMAND": {"#e5e760"};
    case "GROUP": 	{"#beee7e"};
    case "DIRECT": 	{"#fffffb"};
    case "CUSTOM":	{"#ec5a29"};
    case "SYSTEM":	{"#8a8a88"};
    case "BLUFOR": 	{([WEST,false] call BIS_fnc_sideColor) call BIS_fnc_colorRGBtoHTML};
    case "OPFOR": 	{([EAST,false] call BIS_fnc_sideColor) call BIS_fnc_colorRGBtoHTML};
    case "GUER": 	{([INDEPENDENT,false] call BIS_fnc_sideColor) call BIS_fnc_colorRGBtoHTML};
    case "CIV": 	{([CIVILIAN,false] call BIS_fnc_sideColor) call BIS_fnc_colorRGBtoHTML};
};

private _fnc_showSubtitles =
{
	params ["_from", "_text","_colourHTML","_break"];

	// Create display and control
	disableSerialization;
	titleRsc ["RscDynamicText", "PLAIN"];
	private "_display";
	waitUntil {_display = uiNamespace getVariable "BIS_dynamicText"; !(isNull _display)};
	private _ctrl = _display ctrlcreate ["RscStructuredText",-1];
	uiNamespace setVariable ["BIS_dynamicText", displayNull];

	// Position control
	private _w = 0.4 * safeZoneW;
	private _x = (0.5 - _w / 2);
	private _y = (safeZoneY + (7/8) * safeZoneH);
	private _h = safeZoneH;

	_ctrl ctrlSetPosition [_x,_y,_w,_h];

	// Hide control
	_ctrl ctrlSetFade 1;
	_ctrl ctrlCommit 0;

	// Show subtitle
	_text = parseText format ["<t align = 'center' shadow = '2' font='RobotoCondensedBold' size = '%2'><t color = '%1'>" + toUpper _from + ":<br/></t> <t color = '#FFFFFF'>" + _text + "</t></t>",_colourHTML, (safezoneH * 0.65) max 1];
	_ctrl ctrlSetStructuredText _text;
  private _textHeight = ctrltextheight _ctrl;
  _ctrl ctrlSetPosition [_x,_y - _textHeight,_w,_textHeight];
	_ctrl ctrlSetFade 0;
	_ctrl ctrlCommit 0;

	sleep _break;

	// Hide subtitle
	_ctrl ctrlSetFade 1;
	_ctrl ctrlCommit 0.5;

};

//Loop through all given lines
for "_i" from 0 to (count _lines) - 1 do
{
	private _nameSpeaker = (_lines select _i) select 0;
	private _currentLine = (_lines select _i) select 1;
	private _speaker = (_lines select _i) param [2,objNull,[objNull]];
	private _break = count _currentLine * _breakMultiplier;

	if !(isNull _speaker) then {_speaker setRandomLip true};
  if (_colour == "SIDE") then {playSound "RadioTransmit"};
	private _handle = [_nameSpeaker,_currentLine,_colourHTML,_break] spawn _fnc_showSubtitles;
  [_nameSpeaker,_currentLine] call BRM_fnc_MessageLog;
	waitUntil {scriptDone _handle};

	if !(isNull _speaker) then {_speaker setRandomLip false};

	sleep 1;
};

Revo_fnc_simpleConversation_running = nil;

true

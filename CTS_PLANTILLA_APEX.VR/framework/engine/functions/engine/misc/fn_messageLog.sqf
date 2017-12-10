/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / JANUARY 2016

Script: Message parser/log
Author: Whiztler
Script version: 1.01

Game type: n/a
File: ADF_messageParser.sqf
****************************************************************
This script will create and log hint messages based on the caller.
Config the logbook in ADF_fnc_MessageLog (_ADF_logName).
Config the callers in ADF_fnc_MessageParser (if (_ADF_caller == "ACO")).

Use with:
[	"2S",		// caller ID	
	"Name",		// caller Name 
	"Message"		// Message
] call ADF_fnc_MessageParser;

e.g.: ["2S","Name","Message"] call ADF_fnc_MessageParser; sleep 10;
or: : ["ACO","ACO","Message"] call ADF_fnc_MessageParser; sleep 10;
Script is WIP. For now only simple messages (without complex formatting)
****************************************************************/

// init
params ["_ADF_callerName","_ADF_msg"];
private ["_ADF_logName","_logTime","_logTimeText"];

// Which log?
_ADF_logName = "CTS Log";

// Create the logbook entry
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord [_ADF_logName, [_logTimeText,"<br/><br/><font color='#E6E6E6' size='14'>De: " +_ADF_callerName+ "</font><br/><font color='#9da698' size='14'>Hora: " + _logTime + "</font><br/><br/><font color='#9DA698'>------------------------------------------------------------------------------------------</font><br/><br/><font color='#9DA698'>" +_ADF_msg+ "</font><br/><br/>"]];
false

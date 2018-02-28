/*********************************************************************************
 _____ ____  _____
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|
ARMA Mission Development Framework
ADF version: 2.02 / JANUARY 2018

Function: ADF_fnc_lightPoint
Author: Whiztler
Script version: 1.06

File: fn_lightPoint.sqf
**********************************************************************************
ABOUT
Creates a single lightpoint to light up objects (inside/outside). The function
defaults are ideal for adding lights to ARMA 2 watchtowers (Military Cargo Post)

INSTRUCTIONS:
Place an object or game logic on the map and put the following in the init:
[this, 0.2, 1] call BRM_fnc_lightPoint;

The function runs on every connected client and creates the objects locally.

REQUIRED PARAMETERS:
0. Object:      the object that requires the light source

OPTIONAL PARAMETERS:
1. Number:      Light brightness. 0.2 for dim light and 1.0 for very bright light
				Default: 0.3
2. Number:      Altitude light position offset from the object (in meters).
				Default: 2
3. Number:      X-axe offset in meters from the center position of the object.
				Default: 0
4. Number:      y-axe offset in meters from the center position of the object.
				Default: 0

EXAMPLES USAGE IN SCRIPT:
[_tower, 0.5, 1] call BRM_fnc_lightPoint;

EXAMPLES USAGE IN EDEN:
[this, 0.4, 1] call BRM_fnc_lightPoint;

DEFAULT/MINIMUM OPTIONS
[_obj] call BRM_fnc_lightPoint;

RETURNS:
Object (light srouce)
*********************************************************************************/
if (!hasInterface) exitWith {};

// Init
params [
	["_o", objNull, [objNull]],
	["_h", 0.3, [0]],
	["_a", 2, [0]],
	["_px", 0, [0]],
	["_py", 0, [0]]
];
private _z = [_px, _py, _a];

// Check valid vars
if (_h > 1) then {_h = 1;};
if (_a > 99) then {_a = 100;};

// Create the light source
private _l = "#lightpoint" createVehicleLocal [0,0,0];
_l setPos (getPosATL _o);

// Set the light source params
_l setLightBrightness _h;
_l setLightAmbient [1.0, 1.0, 0.5];
_l setLightColor [1.0, 1.0, 1.0];
_l setLightUseFlare true;

// Attache the light source to the object
_l lightAttachObject [_o, _z];
if (_px == 0 && _py == 0) then {
	_l setPos [getPos _l select 0, getPos _l select 1, _a];
};

// Return the light source
_l

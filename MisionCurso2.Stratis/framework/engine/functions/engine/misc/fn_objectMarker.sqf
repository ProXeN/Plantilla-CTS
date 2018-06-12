/*********************************************************************************
 _____ ____  _____
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|
ARMA Mission Development Framework
ADF version: 2.02 / JANUARY 2018

Function: ADF_fnc_objectMarkerArray
Author: Whiztler
Script version: 1.15

File: fn_objectMarkerArray.sqf
**********************************************************************************
ABOUT
Creates gray boundingbox box markers for editor placed or scripted objects. They
then appear as map objects.

INSTRUCTIONS:
The function changes the marker layer. If you have custom marker (e.g.) text
markers, you can re-apply them with the reMarker function (ADF_fnc_reMarker)
Call from script on the server.

REQUIRED PARAMETERS:
0. Object:  Editor placed or scripted object that requires the map marker.

OPTIONAL PARAMETERS:
n/a

EXAMPLES USAGE IN SCRIPT:
[myBunker] call BRM_fnc_objectMarker;

EXAMPLES USAGE IN EDEN:
[myBunker] call BRM_fnc_objectMarker;

DEFAULT/MINIMUM OPTIONS
[myBunker] call BRM_fnc_objectMarker;

RETURNS:
Marker
*********************************************************************************/

if (!isServer) exitWith {};
// init
private _dt = diag_tickTime;
params [
	["_o", objNull, [objNull]]
];

// Check valid vars
if (_o isKindOf "CAManBase") exitWith {};

// Get the object position and box model size
private _p = getPosATL _o;
private _s = (boundingBoxReal _o) select 1;
_s resize 2;

// Create the marker
private _m = createMarker [format ["mObj%1%2", floor(random 9999), floor(_p select 0)], _p];
_m setMarkerShape "RECTANGLE";
_m setMarkerSize _s;
_m setMarkerBrush "SolidFull";
_m setMarkerColor "ColorGrey";
_m setMarkerDir (getDir _o);



_m

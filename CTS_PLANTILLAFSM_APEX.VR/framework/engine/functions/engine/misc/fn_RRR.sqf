/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / JANUARY 2016

Script: Reload/Rearm/Repair Script
Author: Xeno (Adapted for ADF by Whiztler)
Script version: 2.72

Game type: N/A
File: ADF_RRR.sqf
****************************************************************
Instructions:

Create a trigger, make it the size of the service area. Set it to
Activation Anybody Present
Repeat

For Helicopters:
Condition: ("Helicopter" countType thisList  > 0) && ((getPos (thisList select 0)) select 2 < .5)
On activation: 0 = [(thisList select 0)] execVM "Core\ADF_RRR.sqf";

For Airplanes:
Condition: (("Plane" countType thisList  > 0) || ("airplane" countType thisList  > 0) || ("airplanex" countType thisList  > 0)) && ((getPos (thisList select 0)) select 2 < 1) && (speed (thisList select 0) < 10)
On activation: 0 = [(thisList select 0)] execVM "Core\ADF_RRR.sqf";

For Vehicles:
Condition: (("CAR" countType thisList  > 0) || ("TRUCK" countType thisList  > 0) || ("TANK" countType thisList  > 0) || ("APC" countType thisList  > 0)) &&  ((getPos (thisList select 0)) select 2 < 2);
On activation: 0 = [(thisList select 0)] execVM "Core\ADF_RRR.sqf";
****************************************************************/

// Init
private [
	"_ADF_turretConfig", "_ADF_turretCount", "_ADF_vehMag", "_ADF_object", "_ADF_vehName",
	"_ADF_vehType", "_ADF_vehCat", "_ADF_vehDriver", "_ADF_objectDamage", "_ADF_objectFuel",
	"_ADF_repairSleep", "_ADF_reloadSleep", "_ADF_reloadSleep", "_ADF_maxTime", "_ADF_serviceStartTime",
	"_ADF_serviceTime", "_ADF_serviceTimeType"
];

params ["_ADF_object"];
_ADF_vehType = typeOf _ADF_object;
_ADF_vehName = getText(configFile >> "CfgVehicles" >> _ADF_vehType >> "displayName");

ADF_FARP_repairTime = 180; // Maximum time in seconds it takes to repair a vehicle at the FARP.
ADF_FARP_reloadTime = 10; // Maximum time in seconds it takes to re-arm per turret magazine at the FARP.
ADF_FARP_refuelTime = 90; // Maximum time in seconds it takes to refuel a vehicle at the FARP.

if (_ADF_object isKindOf "ParachuteBase") exitWith {};
if (!alive _ADF_object) exitWith {};

if ((_ADF_object isKindOf "Plane") || (_ADF_object isKindOf "Helicopter")) then {
	_ADF_vehDriver = "Piloto";
	_ADF_vehCat = "aeronave";
} else {
	_ADF_vehDriver = "Conductor";
	_ADF_vehCat = "vehiculo";
};

_ADF_repairSleep = ADF_FARP_repairTime / 25;
_ADF_reloadSleep = ADF_FARP_reloadTime / 3;
_ADF_reloadSleep = ADF_FARP_refuelTime / 60;

_ADF_objectFuel = fuel _ADF_object;
_ADF_objectDamage = damage _ADF_object;
_ADF_object setFuel 0;
_ADF_maxTime = round ((ADF_FARP_repairTime + ADF_FARP_reloadTime + ADF_FARP_refuelTime + 30) / 60); // maximum time in MIN
_ADF_serviceStartTime = time;

_ADF_object vehicleChat format ["CTS F.A.R.P."];
_ADF_object vehicleChat format ["Procesando %1", _ADF_vehName];
_ADF_object vehicleChat format ["%1, por favor apaga el motor y mantente en tu %2", _ADF_vehDriver, _ADF_vehCat];
_ADF_object vehicleChat format ["El proceso puede durar hasta %1 minutos.", _ADF_maxTime];

sleep 5;

// REARM
_ADF_vehMag = getArray (configFile >> "CfgVehicles" >> _ADF_vehType >> "magazines");

if (count _ADF_vehMag > 0) then {
	_ADF_vehMagDel = [];
	{
		if (!(_x in _ADF_vehMagDel)) then {
			_ADF_object removeMagazines _x;
			_ADF_vehMagDel = _ADF_vehMagDel + [_x];
		};
	} forEach _ADF_vehMag;
	{
		_ADF_object vehicleChat format ["Reamunicionando %1", _x];
		sleep _ADF_reloadSleep;
		if (!alive _ADF_object) exitWith {};
		_ADF_object addMagazine _x;
	} forEach _ADF_vehMag;
};

_ADF_turretCount = count (configFile >> "CfgVehicles" >> _ADF_vehType >> "Turrets");

if (_ADF_turretCount > 0) then {
	for "_i" from 0 to (_ADF_turretCount - 1) do {
		scopeName "ADF_Reload";
		_ADF_turretConfig = (configFile >> "CfgVehicles" >> _ADF_vehType >> "Turrets") select _i;
		_ADF_vehMag = getArray(_ADF_turretConfig >> "magazines");
		_ADF_vehMagDel = [];
		{
			if (!(_x in _ADF_vehMagDel)) then {
				_ADF_object removeMagazines _x;
				_ADF_vehMagDel = _ADF_vehMagDel + [_x];
			};
		} forEach _ADF_vehMag;
		{
			_ADF_object vehicleChat format ["Reamunicionando %1", _x];
			sleep _ADF_reloadSleep;
			if (!alive _ADF_object) then {breakOut "ADF_Reload"};
			_ADF_object addMagazine _x;
			sleep _ADF_reloadSleep;
			if (!alive _ADF_object) then {breakOut "ADF_Reload"};
		} forEach _ADF_vehMag;
		// check if the main turret has other turrets
		_ADF_turretCount_other = count (_ADF_turretConfig >> "Turrets");

		if (_ADF_turretCount_other > 0) then {
			for "_i" from 0 to (_ADF_turretCount_other - 1) do {
				_ADF_turretConfig2 = (_ADF_turretConfig >> "Turrets") select _i;
				_ADF_vehMag = getArray(_ADF_turretConfig2 >> "magazines");
				_ADF_vehMagDel = [];
				{
					if (!(_x in _ADF_vehMagDel)) then {
						_ADF_object removeMagazines _x;
						_ADF_vehMagDel = _ADF_vehMagDel + [_x];
					};
				} forEach _ADF_vehMag;
				{
					_ADF_object vehicleChat format ["Reamunicionando %1", _x];
					sleep _ADF_reloadSleep;
					if (!alive _ADF_object) then {breakOut "ADF_Reload"};
					_ADF_object addMagazine _x;
					sleep _ADF_reloadSleep;
					if (!alive _ADF_object) then {breakOut "ADF_Reload"};
				} forEach _ADF_vehMag;
			};
		};
	};
};
_ADF_object setVehicleAmmo 1; // Reload all turrets
sleep 2;
_ADF_object vehicleChat format ["Reamunicionamiento completado"];
sleep 2;

// REPAIR
if (!alive _ADF_object) exitWith {};

_ADF_object vehicleChat format ["Reparando %1", _ADF_vehName];
sleep _ADF_repairSleep;
_ADF_object setDamage 0;

sleep 2;
_ADF_object vehicleChat "Reparaciones completadas";
sleep 2;


// REFUEL
if (!alive _ADF_object) exitWith {};
if (_ADF_objectFuel < 1) then {
	_ADF_object vehicleChat format ["Repostando %1", _ADF_vehName];
	while {_ADF_objectFuel < 1 && alive _ADF_object} do {
		_ADF_object setFuel (_ADF_objectFuel + 0.01);
		_ADF_objectFuel = fuel _ADF_object;
		sleep _ADF_reloadSleep;
	};
	sleep 2;
	_ADF_object vehicleChat format ["Repostaje completo"];
	sleep 2;
} else {
	_ADF_object vehicleChat "No se necesita repostaje.";
	if (!alive _ADF_object) exitWith {};
	sleep 2;
};
if (!alive _ADF_object) exitWith {};

// SERVICE FINISHED
_ADF_serviceTime = round ((time - _ADF_serviceStartTime) / 60);
_ADF_serviceTimeType = "minutos";
if ((time - _ADF_serviceStartTime) < 90) then {_ADF_serviceTime = 1;_ADF_serviceTimeType = "minuto"};
_ADF_object vehicleChat format ["La operacion con %1 ha tardado %2 %3. ", _ADF_vehName, _ADF_serviceTime, _ADF_serviceTimeType];
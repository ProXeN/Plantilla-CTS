//									// EXIT if...
if (isMultiplayer && !isServer) exitWith {};				// Not a Server for MP Game

// ************ SETTINGS ***************
dzn_brv_playerLogInterval 		= 1; // seconds
dzn_brv_nonPlayerLogInterval		= 3; // seconds
dzn_brv_attackVectorMaxDistance		= 1200; // meters

// ************** INIT *****************
dzn_brv_timeLabel 		= 0;
dzn_brv_unitList 		= [];
dzn_brv_vehList 		= [];
dzn_brv_unitIdMax 		= 0;
dzn_brv_vehIdMax 		= 500;
dzn_brv_allowedVehiclesCategories	= ["LandVehicle","Air","Ship_F"];
dzn_brv_guid  			= "";

call compile preprocessfilelinenumbers "framework\plugins\dzn_brv\functions\dzn_brv_functions.sqf";
[] execFSM "framework\plugins\dzn_brv\FSMs\dzn_brv_loop.fsm";

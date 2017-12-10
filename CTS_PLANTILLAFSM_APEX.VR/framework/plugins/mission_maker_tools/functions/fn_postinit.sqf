
if (isMultiplayer) exitWith {};

fnc_teleport = {
    #include "mapTeleport.sqf"
};

fnc_openArsenal = {
    ["Open",true] spawn BIS_fnc_arsenal;
};

fnc_stopAI = {
    { _x stop true } forEach allUnits;
};

fnc_initAI = {
    { if (!(isPlayer _x)&&(_x isKindOf "CAManBase")) then { [_x, "auto"] call BRM_fnc_initAI }  } forEach allUnits;
};

if (local player) then {
	player addAction ["<t align='left' color='#C0C0C0'>––[ <t color='#FFFFFF'>Opciones Debug<t color='#C0C0C0'> ]––––––",nil];
	player addAction ["<t align='left' color='#F7D358'>Mostrar Posicion</t>",{execVM "framework\plugins\mission_maker_tools\functions\fn_snipPosition.sqf";}];
	player addAction ["<t align='left' color='#F7D358'>Modo Civil ON/OFF</t>",{if (captive player) then {player setCaptive false; player allowDamage true; hintSilent "Civilian Mode OFF";} else {player setCaptive true; player allowDamage false; hintSilent "Civilian Mode ON";};}];
};

if (isServer && !isDedicated) then {
	waitUntil {player == player && alive vehicle player};
	player addAction ["<t align='left' color='#F7D358'>Mostrar Unidades/Veh/Obj.</t>",{execVM "framework\plugins\mission_maker_tools\functions\fn_snipObjects.sqf";}];
	player addAction ["<t align='left' color='#F7D358'>Mostrar Distancia Objeto-Jugador</t>",{execVM "framework\plugins\mission_maker_tools\functions\fn_snipDistance.sqf";}];
	player addAction ["<t align='left' color='#F7D358'>Mostrar Classname</t>",{execVM "framework\plugins\mission_maker_tools\functions\fn_snipIdClassname.sqf";}];
	player addAction ["<t align='left' color='#F7D358'>Iniciar Deteccion OpFor</t>",{execVM "framework\plugins\mission_maker_tools\functions\fn_snipDetect.sqf";}];
	player addAction ["<t align='left' color='#F7D358'>Parar OpFor Detection</t>",{ADF_terminate_detect = true; publicVariable "ADF_terminate_detect"}];
	player addAction ["<t align='left' color='#F7D358'>Tiempo +6 hours</t>",{skipTime 6;}];
	player addAction ["<t align='left' color='#F7D358'>Tiempo -6 hours</t>",{skipTime -6;}];
	player addAction ["<t align='left' color='#F7D358'>Iniciar IA</t>", fnc_initAI];
	player addAction ["<t align='left' color='#F7D358'>Parar IA</t>", fnc_stopAI];
	player addAction ["<t align='left' color='#F7D358'>Spawn Grupo NATO", {execVM "framework\plugins\mission_maker_tools\functions\fn_snipSpawnBlufor.sqf";}];
	player addAction ["<t align='left' color='#F7D358'>Spawn Grupo CSAT", {execVM "framework\plugins\mission_maker_tools\functions\fn_snipSpawnOpfor.sqf";}];
	player addAction ["<t align='left' color='#F7D358'>Spawn Littlebird", { _veh = createVehicle [ "B_Heli_Light_01_F", player modelToWorld [0, 10, 0], [], 0, "CAN_COLLIDE" ]; _veh setDir (direction player - 90); _veh setVectorUp surfaceNormal position _veh; _veh  setObjectTextureGlobal  [0, "A3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"];}];
	player addAction ["<t align='left' color='#F7D358'>Spawn Hunter", { _veh = createVehicle [ "B_MRAP_01_F", player modelToWorld [0, 10, 0], [], 0, "CAN_COLLIDE" ]; _veh setDir (direction player - 90); _veh setVectorUp surfaceNormal position _veh; _veh  setObjectTextureGlobal [0, "#(rgb, 8, 8, 3)color(0, 0, 0, 1)"]; /*_veh  setObjectTextureGlobal  [1, "#(rgb, 8, 8, 3)color(0.64, 0.64, 0.64, 1)"];*/}];
	player addAction ["<t align='left' color='#F7D358'>Spawn Barco", { _veh = createVehicle [ "C_Boat_Civil_01_rescue_F", player modelToWorld [0, 10, 0], [], 0, "CAN_COLLIDE" ]; _veh setDir (direction player - 90);}];
};

if (local player) then {
	player addAction ["<t align='left' color='#C0C0C0'>––––––––––––––––––––––––",nil];
};

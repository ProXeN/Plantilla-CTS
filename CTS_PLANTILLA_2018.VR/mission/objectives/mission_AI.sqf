
// ============================================================================
//                                                                             |
//         Usa este script para ejecutar todas las funciones y scripts         |
//                   relacionados con la creación de IA.                       |
//                                                                             |
//     Recuerda que el controlador de la IA (HC por defecto) será el único     |
//                          que ejecute estas líneas                           |
//                                                                             |
//        Abajo tenéis algunos ejemplos para crear zonas DAC                   |
//                                                                             |
// ============================================================================

[{(mission_AI_controller)}, {
	//T8
	//Este sistema es algo más complejo. Evitadlo si no tenéis nociones básicas de scripting.
	/*
	if ("t8" in usedPlugins) then { [{(!isNil "T8u_var_initDone") && (time > 5)}, {
	//Creamos arrays con los tipos de grupos que queremos spawnear.
	_smallGroup = [ "O_soldier_TL_F", "O_medic_F", "O_soldier_F" ]; //Grupo pequeño de tres hombres para patrullas
	_LSVGroup = [ "O_soldier_TL_F", "O_medic_F", "O_soldier_F", "O_T_LSV_02_armed_F" ]; //Grupo de 3 hombres + LSV
	_bigGroup = [ "O_soldier_SL_F", "O_medic_F", "O_soldier_F", "O_soldier_AR_F", "O_soldier_TL_F", "O_soldier_F", "O_soldier_F", "O_soldier_LAT_F" ]; //Grupo de 8 hombres.

	//Creamos las zonas, indicando qué grupos y con qué tarea.
	unitsZone1 =
	[        //Grupo    //Punto de spawn //Son solo Inf? //Bando     //Tarea         //Piden refuerzos? //Dan apoyo a otros grupos?  //False si task es DEFEND/DEFEND_BASE
		[ [  _LSVGroup, "mZone_1",       false,            EAST ], [ "PATROL" ], [true,            true,                            true] ],
		[ [  _smallGroup, "mZone_1", true, EAST ], [ "PATROL" ], [true, true, true] ],
		[ [  _smallGroup, "mZone_1", true, EAST ], [ "PATROL_AROUND" ], [true, true, true] ],
		[ [  _smallGroup, "mZone_1", true, EAST ], [ "PATROL" ], [true, true, true] ],
		[ [  _bigGroup, "mZone_1", true, EAST ], [ "GARRISON" ], [true, true, true] ],
		[ [  _bigGroup, "mZone_1", true, EAST ], [ "OCCUPY" ], [true, true, true] ]
	];

	unitsZone2 =
	[
		[ [  _smallGroup, "mZone_2", true, EAST ], [ "PATROL" ], [true, true, true] ],
		[ [  _smallGroup, "mZone_2", true, EAST ], [ "PATROL" ], [true, true, true] ],
		[ [  _smallGroup, "mZone_2", true, EAST ], [ "PATROL" ], [true, true, true] ],
		[ [  _bigGroup, "mZone_2", true, EAST ], [ "PATROL_GARRISON" ], [true, true, true] ]
	];

	//Activamos las zonas
	//La Zona 1 se creará al inicio de la misión
	[ unitsZone1 ] spawn T8U_fnc_Spawn;
	//La Zona 2 se creará cuando las unidades WEST estén a 800 metros del marcador. Si luego se alejan a más de 800 metros, las unidades de EAST se cachearán para ahorrar recursos.
	["unitsZone2", "mZone2", "EAST", "WEST", 800] spawn T8U_fnc_Zone;

	//Tasks disponibles:
	//"PATROL" Patrulla aleatoria dentro del marcador.
	//"PATROL_AROUND" Patrulla circular alrededor del marcador.
	//"PATROL_URBAN" Patrulla aleatoria por calles dentro del marcador.
	//"OCCUPY" Ocupan edificios cercanos y vigilar ventanas. Intentan permanecer juntos y no moverse.
	//"GARRISON" Ocupan edificios (o arbustos/rocas si no hay ninguno cerca). Se mueven entre posiciones.
	//"PATROL_GARRISON" Igual que PATROL_URBAN, pero irán entrando en edificios de forma aleatoria.
	//"DEFEND" Ocupan estáticas. Los que se queden sin harán patrulla por el centro del marcador.
	//"DEFEND_BASE" Ocupan estáticas y posiciones en edificios militares.
	//"OVERWATCH" Buscan posición elevada para tener visual con el marcador
	//"ATTACK" Atacan posición, normalmente flanqueando.
	//"LOITER" Dan vueltas alrededor del marcador. Si hay tiendas de campaña u hogueras se sentarán al lado. Algunos se quedarán quietos de pie haciendo animaciones.



	}, []] call CBA_fnc_waitUntilAndExecute }; */

}, []] call CBA_fnc_waitUntilAndExecute;

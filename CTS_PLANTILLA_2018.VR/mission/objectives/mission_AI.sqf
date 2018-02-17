
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

	//DAC
	if ("dac_plugin" in usedPlugins) then { [{(!isNil "BRM_DAC_fnc_new") && (time > 5)}, {
		[trg1, "Create an activated normal default friendly zone named zone1 on network 1, with 1 group of infantry."] spawn BRM_DAC_fnc_new;
		[c1, "Create 1 normal default friendly camp named random on network 1, with 1 respawns of infantry supporting zone1."] spawn BRM_DAC_fnc_new;
		// /* ================================================

		// EJEMPLOS DE ZONAS DAC

		// RECORDAD DESACTIVAR EL DAC EN framework\plugins\plugins.cpp SI NO CREAIS NINGUNA ZONA PARA EVITAR PROBLEMAS CON NIEBLA

		// Enemigos fáciles, 1 escuadra de infantería:
		// [trg1, "Create an activated easy default enemy zone named anything on network random, with 1 squad of infantry."] spawn BRM_DAC_fnc_new;

		// Enemigos difíciles, infantería, vehículos y blindados:
		// [trg2, "Create an activated hard default enemy zone named anything on network random, with 2 squads of infantry, 2 fire-teams of vehicles and 1 group of armor."] spawn BRM_DAC_fnc_new;

		// Zona con nombre y networks propios.
		// [trg3, "Create an activated normal default friendly zone named NamedZone1 on network 2, with 2 squads of vehicles."] spawn BRM_DAC_fnc_new;

		// Zona con 1 campamento aliado dando soporte a la zona NamedZone1 con 25 respawns de infantería.
		// [trg1, "Create 1 normal default friendly camp named anything on a random network, with 25 respawns of infantry supporting NamedZone1."] spawn BRM_DAC_fnc_new;

		// Zona con 1 campamento aliado dando soporte a todas las zonas en Network 2 con 25 respawns de infantería.
		// [c1, "Create 1 normal default friendly camp named anything on network 2, with 25 respawns of infantry."] spawn BRM_DAC_fnc_new;

		// Zona con 3 campamentos aliados dando soporte a la zona NamedZone1, NamedZone2, NamedZone 3 y a todas las zonas en Network 2, con 25 respawns de infantería.
		// [c1, "Create 3 normal default friendly camps named anything on network 2, with 25 respawns of infantry supporting NamedZone1, NamedZone2 and NamedZone3."] spawn BRM_DAC_fnc_new;

		// =================================================== */

	}, []] call CBA_fnc_waitUntilAndExecute };

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

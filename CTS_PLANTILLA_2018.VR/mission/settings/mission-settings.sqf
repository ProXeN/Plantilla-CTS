mission_settings_loaded = false;

// ============================================================================
//                                                                             |
//    Aquí es donde configuráis los valores principales de la misión           |
//                                                                             |
// ============================================================================

// ============================================================================
//                         == CREDITOS E INTRO ==                              |
//                                                                             |
//      Aquí colocáis el nombre del autor de la misión, la versión             |
//          de la misma, y el tipo de intro que queréis. Los tipos             |
//                           disponibles son:                                  |
//                  "TILES", "APEX", "CAMERA", "DOOM"                          |
//                                                                             |
// ============================================================================

mission_author_name = ["Proxen"];
mission_version =    "v1.0";
intro_cutscene = "APEX";

// ============================================================================
//                          ==   LOADOUT MODE   ==                             |
//                                                                             |
//           Aquí elegís si queréis que la plantilla aplique                   |
//                  las equipaciones automáticamente o no.                     |
//           Dejadlo en false si queréis que lo haga, o ponedlo                |
//      en true si preferís editar las equipaciones manualmente desde el       |
//                            arsenal del editor.                              |
//                                                                             |
// ============================================================================

units_player_useVanillaGear = false; //JUGADORES
units_AI_useVanillaGear = false; //IA

// ============================================================================
//                              == FACCIONES ==                                |
//                                                                             |
//      Aquí seleccionáis el bando y las facciones de los jugadores y la iA.   |
//                                                                             |
// ============================================================================

side_a_side = west;                 // Bando de los jugadores.
side_a_faction = "CTSMC";            // Facción de los jugadores. Las disponibles son:
// MULTICAM "CTSMC"
// MULTICAM ARIDO "CTSMCA"
// MULTICAM TROPIC "CTSMCT"
// =============================================================================

side_b_side = east;                 // Bando de la IA.
side_b_faction = "CSAT";            // Facción de la IA
// FACCIONES OPFOR A ELEGIR
// CSAT, OPFIA, AAF, RUSSIA, ISIS, SYNDIKAT, VDV, CHEDAKI
// =============================================================================

side_c_side = resistance;           // Bando de la resistencia
side_c_faction = "AAF";             // Facción de la resistencia

// ============================================================================
//                            == PERMITIR JIP ==                               |
//                                                                             |
//                   Elegid si queréis que haya JIP o no                       |
//                                                                             |
// ============================================================================

mission_allow_jip = true;

// Asigna propiedades a los bandos =============================================

[] call BRM_fnc_assignSideProperties;

// =============================================================================
//  TFAR Radio Freqs
// =============================================================================
CTSfreqs = [					  //Frecuencias TFAR para los grupos
  [31,    32],   //0_0
  [31,    33],   //1_0
  [31,    36],   //2_0
  [31,    39],   //3_0
  [31,    42],   //4_0
  [31,    45],   //5_0
  [31,    46],   //6_0
  [31,    47],   //7_0
  [31,    48],   //8_0
  [31,    49],   //9_0
  [31,    50]    //10_0
];

// =============================================================================
mission_settings_loaded = true;

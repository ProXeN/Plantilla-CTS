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
intro_cutscene = "DOOM";

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
side_a_faction = "CTSMCA";           // Facción de los jugadores. Las disponibles son:
silenciadores = false;              // Activa o desactiva silenciadores
nocturno = false;                    // Activa o desactiva equipamiento nocturno
baseBriefing = false;                        // True si salimos sin equipar en base
// MULTICAM "CTSMC"
// MULTICAM ARIDO "CTSMCA"
// MULTICAM TROPIC "CTSMCT"
// =============================================================================

side_b_side = east;                 // Bando de la IA.
side_b_faction = "AAF2017";            // Facción de la IA
// FACCIONES OPFOR A ELEGIR
// CSAT, AAF, RUSSIA, ISIS, SYNDIKAT, VDV, CHEDAKI, AAF2017, GUERRILLA, PLA
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

// ============================================================================
//                              == ENDINGS ==                                  |
//                                                                             |
//        These are the endings that are called when conditions are met.       |
//                                                                             |
//         Some can be ignored if you aren't using the related plugin.         |
//                                                                             |
// ============================================================================

endings_victory = "victory";                    // (COOP) Objectives completed.
endings_defeat = "defeat";                      // (COOP) Critical objective failed.

endings_civilians_killed = "defeat";            // (COOP) Max number of civies killed.
endings_time_over = "defeat";                   // (COOP) Time limit reached.

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

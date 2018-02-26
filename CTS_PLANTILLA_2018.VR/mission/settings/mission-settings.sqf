mission_settings_loaded = false;

// ============================================================================
//                                                                             |
//    This is where you edit the mission values for your mission, have fun!    |
//                                                                             |
// ============================================================================

// ============================================================================
//                       == CREDITS AND VERSION ==                             |
//                                                                             |
//      Before we get started, write down the author name and the mission      |
//          version just so you can keep track of the credits easier!          |
//                                                                             |
// ============================================================================

mission_author_name = ["Proxen"];
mission_version =    "v1.0";
intro_cutscene = "APEX";

// ============================================================================
//                          ==   LOADOUT MODE   ==                             |
//                                                                             |
//           Determines if players will get any loadouts at all.               |
//                                                                             |
// ============================================================================

units_player_useVanillaGear = false;
units_AI_useVanillaGear = false;

// ============================================================================
//                        == PLAYERS INFORMATION ==                            |
//                                                                             |
//            Edit this value with the side the players belong to.             |
//                            Valid values are:                                |
//                                                                             |
//                         west, east, resistance                              |
//                                                                             |
//   Valid colors are: "blue","red","green","white","black" and "yellow".      |
//                                                                             |
// ============================================================================

side_a_side = west;                 // Side the players belong to
side_a_faction = "CTSMCT";            // Faction of the players.

// =============================================================================

side_b_side = east;                 // Side the enemies belong to
side_b_faction = "CSAT";            // Enemy faction.

// =============================================================================

side_c_side = resistance;           // Side of third faction.
side_c_faction = "AAF";             // Third side's faction.

// =============================================================================

DAC_Res_Side = 1;                    // Side the independent are friendly to:
                                     // 0: EAST / 1: WEST / 2: NOBODY
                                     // (MUST BE THE SAME AS THE EDITOR!)

// ============================================================================
//                           == ALLOW JIP ==                                   |
//                                                                             |
//      If this value is set to false, JIPs will be removed upon joining.      |
//                                                                             |
// ============================================================================

mission_allow_jip = true;

// Assigns the properties to the sides. ========================================

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

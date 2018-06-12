
// ============================================================================
//                                                                             |
//                    Executes all mission Briefings.                          |
//                                                                             |
// ============================================================================

0 spawn {

    ["LOCAL", "F_LOG", "PLAYER: ASSIGNING WEST BRIEFING"] call BRM_fnc_doLog;
    #include "briefing-west.sqf";

};
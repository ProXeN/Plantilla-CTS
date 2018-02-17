
// INFO ========================================================================
/*
    Formed at the apex of the Canton Protocol summits, this strategic alliance of
    states is built upon the goals of mutual defence, expanded global influence, and
    sustained economic growth.
*/
// =============================================================================

_factionID = "CSAT";
_factionName = "CSAT Chino";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceCHINESE];
_defaultFace = [_faceASIAN];
_defaultName = [_nameCHINESE];
_defaultInsignia = "";
_defaultColor = "red";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _CTARGhx;
_commonRIFLEGL = _CTARGLGhx;
_commonPISTOL = _Rook;
_commonMG = _CTARSGhx;
_commonMARKSMAN = _QBU88Ghx;
_commonSNIPER = _GM6Ghx;
_commonAT = _RPG32Ghx;
_specAT = _TitanGhx;
_commonSMG = _Sting;
_commonRCO = _ARCOghex;
_commonCCO = _ACOgreen;
_commonMAGNIFIED = _DMSgHex;
_commonSUPPRESSOR = _sup58ghex;
_commonPISTOLSUPPRESSOR = _sup9mm;
_NVG = _CSATNVghex;

// AMMO COUNT ==================================================================

_countRIFLE = 7;
_countRIFLELOW = 4;
_countPISTOL = 2;
_countMG = 3;
_countSNIPER = 5;
_countAT = 3;
_countGRENADES = 3;
_count40mm = 20;

_countTracerRIFLE = 2;
_countTracerMG = 1;
_countHE = 1;

_countRifleCARGO = 30;
_countPistolCARGO = 10;
_countMgCARGO = 20;
_countSniperCARGO = 30;
_countATCARGO = 15;
_countGrenadesCARGO = 20;
_count40mmCARGO = 40;

// MEDICAL =====================================================================

_countBANDAGE = 20;
_countMORPHINE = 10;
_countEPI = 5;
_countCAT = 3;
_countBLOODBAG = 5;
_countPAK = 2;

_countBandageCARGO = 40;
_countMorphineCARGO = 30;
_countEpiCARGO = 20;
_countBloodbagCARGO = 20;
_countPAKCARGO = 10;

// UNIFORMS ====================================================================

_commonHEAD = "H_HelmetO_ghex_F";
_leaderHEAD = "H_HelmetLeaderO_ghex_F";
_officerHEAD = "H_MilCap_ghex_F";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "H_HelmetCrew_O";
_pilotHEAD = "H_PilotHelmetFighter_O";
_helicrewHEAD = "H_CrewHelmetHeli_O";
_helipilotHEAD = "H_PilotHelmetHeli_O";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "H_HelmetSpecO_ghex_F";
_viperHEAD = "H_HelmetO_ViperSP_ghex_F";

_commonUNIFORM = "U_O_T_Soldier_F";
_officerUNIFORM = "U_O_T_Officer_F";
_pilotUNIFORM = "U_O_PilotCoveralls";
_sniperUNIFORM = "U_O_T_FullGhillie_tna_F";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "U_O_PilotCoveralls";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;
_viperUNIFORM = "U_O_V_Soldier_Viper_F";

_commonVEST = "V_HarnessO_ghex_F";
_officerVEST = "V_BandollierB_ghex_F";
_ftlVEST = _commonVEST;
_slVEST = _commonVEST;
_mgVEST = _commonVEST;
_grenadierVEST = "V_HarnessOGL_ghex_F";
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;

_commonBACKPACK = "B_FieldPack_ghex_F";
_bigBACKPACK = "B_Carryall_ghex_F";
_viperBACKPACK = "B_ViperHarness_ghex_TL_F";

// EXTRA EQUIPMENT =============================================================

_HMG = "O_HMG_01_A_high_weapon_F";
_HMGTripod = "O_HMG_01_support_F";

_StaticAT = "O_AT_01_weapon_F";
_ATTripod = "O_HMG_01_support_F";

_mortar = "O_Mortar_01_weapon_F";
_mortarTripod = "O_Mortar_01_support_F";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles */	 ["O_T_APC_Tracked_02_AA_ghex_F"]
/*  Attack Helos      */  ,["O_Heli_Attack_02_black_F"]
/*  Attack Planes     */	,["O_Plane_CAS_02_F"]
/*  Heavy Vehicles    */	,["O_T_MBT_02_cannon_ghex_F","O_T_APC_Tracked_02_cannon_ghex_F", "O_T_APC_Wheeled_02_rcws_ghex_F"]
/*  Light Vehicles    */	,["O_T_LSV_02_armed_F", "O_T_LSV_02_unarmed_F"]
/*  Medium Vehicles   */	,["O_T_MRAP_02_hmg_ghex_F", "O_T_MRAP_02_ghex_F"]
/*  Mobile Artillery  */	,["O_T_MBT_02_arty_ghex_F"]
/*  Transport Helos   */	,["O_Heli_Light_02_unarmed_F","O_Heli_Transport_04_covered_black_F"]
/*  Transport Planes  */	,["O_T_VTOL_02_infantry_F"]
/*  Transport Trucks  */	,["O_T_Truck_03_transport_ghex_F", "O_T_Truck_03_covered_ghex_F"]
/*  Static Defence    */	,["O_HMG_01_high_F","O_static_AA_F","O_static_AT_F","O_Mortar_01_F"]
/*  Boats             */	,["O_Boat_Armed_01_hmg_F"]
/*  UAV               */	,["O_UAV_02_CAS_F","O_UAV_02_F"]
/*  UGV               */	,["O_T_UGV_01_ghex_F","O_T_UGV_01_rcws_ghex_F"]
/*  Support           */	,["O_T_Truck_03_ammo_ghex_F","O_T_Truck_03_fuel_ghex_F", "O_T_Truck_03_medical_ghex_F", "O_T_Truck_03_repair_ghex_F"]
/*  Submarines        */	,["O_SDV_01_F"]
/*  MRAP Vehicles     */  ,["O_T_MRAP_02_hmg_ghex_F"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_CSAT_F",
/* Objects      */ ["C_T_supplyCrate_F"],
/* Walls        */ ["Land_HBarrier_01_wall_4_green_F"],
/* Structures   */ ["Land_Cargo_Tower_V4_F"]
];

// =============================================================================

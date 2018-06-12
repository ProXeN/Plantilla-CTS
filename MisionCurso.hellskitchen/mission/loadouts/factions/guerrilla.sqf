
// INFO ========================================================================
/*
   FIA forces has been known aroudn the world due to the operation codename :
   OPERATION FLASHPOINT, they proved themselves to be successfull on guerilla
   tactics and small scale operation even before the US intervention.

   Now they come back kick ass and resist agaisnt the Reds with training given
   by US Delta Force.
*/
// =============================================================================

_factionID        = "GUERRILLA";
_factionName      = "Insurgency";
_factionStructure = "MID-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide     = WEST;
_defaultVoice    = [_voiceRUSSIAN];
_defaultFace     = [_faceWHITE, _faceASIAN];
_defaultName     = [_nameRUSSIAN];
_defaultInsignia = "";
_defaultColor    = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE            = _RHSAKM;
_commonRIFLEGL          = _RHSM16A4GL;
_commonPISTOL           = _M9;
_commonMG               = _M249;
_commonMARKSMAN         = _M76;
_commonSNIPER           = _M2010;
_commonAT               = _RPG26;
_specAT                 = _RPG7;
_commonSMG              = _RHSAKS74U;
_commonRCO              = "rhsusf_acc_eotech_552";
_commonCCO              = "";
_commonMAGNIFIED        = "rhs_acc_pso1m2";
_commonSUPPRESSOR       = _sup762;
_commonPISTOLSUPPRESSOR = _sup9mm;
_NVG                    = _NVGEN1;

// AMMO COUNT ==================================================================

_countRIFLE    = 10;
_countRIFLELOW = 6;
_countPISTOL   = 2;
_countMG       = 4;
_countSNIPER   = 8;
_countAT       = 3;
_countGRENADES = 3;
_count40mm     = 20;

_countTracerRIFLE = 2;
_countTracerMG    = 0;
_countHE          = 1;

_countRifleCARGO    = 30;
_countPistolCARGO   = 20;
_countMgCARGO       = 30;
_countSniperCARGO   = 30;
_countATCARGO       = 20;
_countGrenadesCARGO = 20;
_count40mmCARGO     = 40;

// MEDICAL =====================================================================

_countBANDAGE = 20;
_countMORPHINE = 10;
_countEPI = 5;
_countCAT = 3;
_countBLOODBAG = 5;
_countPAK = 2;

_countBandageCARGO  = 40;
_countMorphineCARGO = 30;
_countEpiCARGO      = 30;
_countBloodbagCARGO = 30;
_countPAKCARGO      = 40;

// UNIFORMS ====================================================================

_headsLIST = [
    "H_Bandanna_khk",
    "FGN_AAF_Boonie_Multicam",
    "FGN_AAF_Boonie_M81",
    "rhs_beanie_green",
    "H_Cap_blk",
    "FGN_AAF_Boonie_Marpat",
    "FGN_AAF_Cap_M81",
    "H_Shemag_olive",
    "H_Bandanna_sand"
];

_uniformsLIST = [
    "FGN_FIA_M10_Marpat_DB",
    "FGN_FIA_M10_Multicam",
    "FGN_FIA_M93_M81",
    "FGN_FIA_M93_Rhodesian",
    "FGN_FIA_M10_MarpatM81"
];

_vestsLIST = [
    "FGN_AAF_BallisticVest_Coyote",
    "FGN_AAF_M99Vest_M81_Radio",
    "FGN_AAF_BallisticVest_AK_M81",
    "FGN_AAF_M99Vest_M81",
    "FGN_AAF_M99Vest_Khaki",
    "FGN_AAF_M99Vest_Khaki_Rifleman",
    "FGN_AAF_M99Vest_M81_Rifleman",
    "V_Chestrig_blk",
    "V_Chestrig_rgr"
];

_gogglesLIST = [];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;

_commonHEAD    = _randomHEAD;
_leaderHEAD    = _commonHEAD;
_officerHEAD   = _commonHEAD;
_medicHEAD     = _commonHEAD;
_crewmanHEAD   = "rhs_tsh4_bala";
_pilotHEAD     = "rhsusf_hgu56p";
_helicrewHEAD  = "rhs_zsh7a_mike_green_alt";
_helipilotHEAD = "rhs_zsh7a_mike_green_alt";
_sniperHEAD    = _randomHEAD;
_demoHEAD      = _commonHEAD;
_reconHEAD     = _randomHEAD;

_commonUNIFORM   = _randomUNIFORM;
_officerUNIFORM  = _commonUNIFORM;
_pilotUNIFORM    = _commonUNIFORM;
_sniperUNIFORM   = _randomUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = _commonUNIFORM;
_crewUNIFORM     = _commonUNIFORM;
_mgUNIFORM       = _commonUNIFORM;
_medicUNIFORM    = _commonUNIFORM;
_demoUNIFORM     = _commonUNIFORM;
_reconUNIFORM    = _randomUNIFORM;

_commonVEST    = _randomVEST;
_officerVEST   = _commonVEST;
_ftlVEST       = _commonVEST;
_slVEST        = _commonVEST;
_mgVEST        = _commonVEST;
_grenadierVEST = _commonVEST;
_medicVEST     = _commonVEST;
_demoVEST      = _commonVEST;
_marksmanVEST  = _commonVEST;
_reconVEST     = _commonVEST;

_commonBACKPACK = "FGN_AAF_Fieldpack_M81_MG";
_bigBACKPACK = "FGN_FIA_FAST_Multicam_MG";

// EXTRA EQUIPMENT =============================================================

_HMG = "RHS_M2_Gun_Bag";
_HMGTripod = "RHS_M2_Tripod_Bag";

_StaticAT = "rhs_Tow_Gun_Bag";
_ATTripod = "rhs_TOW_Tripod_Bag";

_mortar = "rhs_M252_Gun_Bag";
_mortarTripod = "rhs_M252_Bipod_Bag";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/* 0 - Anti Air Vehicles */  ["rhs_zsu234_aa", "rhs_zsu234_aa"]
/* 1 - Attack Helos      */ ,["RHS_Mi24P_AT_vvs", "RHS_Mi24P_vvs", "RHS_Mi24V_AT_vvs"]
/* 2 - Attack Planes     */ ,["RHS_Su25SM_vvs", "RHS_Su25SM_CAS_vvs", "RHS_Su25SM_KH29_vvs"]
/* 3 - Heavy Vehicles    */ ,["rhs_sprut_vdv", "rhs_t72ba_tv"]
/* 4 - Light Vehicles    */ ,["rhs_uaz_vdv", "rhs_uaz_open_vdv"]
/* 5 - Medium Vehicles   */ ,["rhs_btr60_vdv", "rhs_bmd1", "rhs_bmp1d_vdv"]
/* 6 - Mobile Artillery  */ ,["rhs_2s3_tv", "rhs_9k79_B", "RHS_BM21_VV_01"]
/* 7 - Transport Helos   */ ,["RHS_Mi8mt_vvs"]
/* 8 - Transport Planes  */ ,["RHS_AN2_B", "RHS_AN2_B"]
/* 9 - Transport Trucks  */ ,["rhs_gaz66_msv", "rhs_gaz66_flat_msv"]
/*10 - Static Defence    */ ,["rhs_Metis_9k115_2_msv", "rhs_Kornet_9M133_2_msv", "rhs_Igla_AA_pod_msv", "rhs_KORD_MSV", "rhs_KORD_high_MSV", "rhs_SPG9M_MSV", "RHS_ZU23_MSV"]
/*11 - Boats             */ ,["O_Boat_Armed_01_hmg_F", "O_Boat_Transport_01_F"]
/*12 - UAV               */ ,["rhs_pchela1t_vvs", "rhs_pchela1t_vvs"]
/*13 - UGV               */ ,["O_UGV_01_rcws_F"]
/*14 - Support           */ ,["rhs_gaz66_ammo_vv", "RHS_Ural_Fuel_VDV_01", "O_Truck_02_box_F"]
/*15 - Submarines        */ ,["O_SDV_01_F", "O_SDV_01_F"]
/*     MRAP Vehicles     */ ,["rhsusf_rg33_o", "rhsusf_rg33_m2_o", "rhsusf_M1117_O"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_NATO_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_Mil_WallBig_4m_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================

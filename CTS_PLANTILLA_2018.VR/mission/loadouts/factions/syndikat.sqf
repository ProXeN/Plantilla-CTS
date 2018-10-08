// INFO ========================================================================
/*
    This is the template you can use to create your own loadouts.

    Customize it as you wish.
*/

_factionID = "SYNDIKAT";
_factionName = "Syndikat";
_factionStructure = "LOW-TIER";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceFRENCH];
_defaultFace = [_faceTANOAN];
_defaultName = [_nameAFRICAN];
_defaultInsignia = "none";
_defaultColor = "black";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_rifleList = [_AK12, _AKM, _AK74U];
_rifleGLList = [_AK12GL, _RHSAKMGL, _RHSAKMSGL];

_randomRifle = _rifleList call BIS_fnc_selectRandom;
_randomRifleGL = _rifleGLList call BIS_fnc_selectRandom;

_commonRIFLE = _randomRifle;
_commonRIFLEGL = _randomRifleGL;
_commonPISTOL = _Makarov;
_commonMG = _SAW;
_commonMARKSMAN = _M14Camo;
//_commonSNIPER = _GM6;
_commonAT = _RPG7;
_specAT = _RPG7;
/*_commonSMG = _Mk20C;
_commonRCO = _ARCO;
_commonCCO = _EOT;
_commonMAGNIFIED = _SOS;
_commonSUPPRESSOR = "muzzle_snds_M";
_commonPISTOLSUPPRESSOR = "muzzle_snds_L";
_NVG = _NVGEN1;*/

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

_uniformsLIST = [
  "U_I_C_Soldier_Para_1_F",
  "U_I_C_Soldier_Para_2_F",
  "U_I_C_Soldier_Para_3_F",
  "U_I_C_Soldier_Para_4_F",
  "U_I_C_Soldier_Para_5_F",
  "U_I_C_Soldier_Camo_F"
];

_vestsLIST = [
  "V_TacVest_blk",
  "V_TacVest_brn",
  "V_TacVest_camo",
  "V_TacVest_khk",
  "V_TacVest_oli",
  "V_Chestrig_oli",
  "V_Chestrig_khk"
];

_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;

_commonHEAD = "empty";
_leaderHEAD = _commonHEAD;
_officerHEAD = _commonHEAD;
_medicHEAD = _commonHEAD;
_crewmanHEAD = _commonHEAD;
_pilotHEAD = _commonHEAD;
_helicrewHEAD = _commonHEAD;
_helipilotHEAD = _commonHEAD;
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = _commonHEAD;

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = _commonUNIFORM;
_sniperUNIFORM = _commonUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = _commonUNIFORM;
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = _randomVEST;
_officerVEST = _commonVEST;
_ftlVEST = _commonVEST;
_slVEST = _commonVEST;
_mgVEST = _commonVEST;
_grenadierVEST = _commonVEST;
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;

_commonBACKPACK = "B_AssaultPack_rgr";
_bigBACKPACK = "B_Carryall_oli";

// EXTRA EQUIPMENT =============================================================

_HMG = "B_HMG_01_high_weapon_F";
_HMGTripod = "B_HMG_01_support_F";

_StaticAT = "B_AT_01_weapon_F";
_ATTripod = "B_HMG_01_support_F";

_mortar = "B_Mortar_01_weapon_F";
_mortarTripod = "B_Mortar_01_support_F";

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
/* Flag         */ "Flag_Syndikat_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_Mil_WallBig_4m_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================

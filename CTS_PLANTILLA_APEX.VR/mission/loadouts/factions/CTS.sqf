
// INFO ========================================================================
/*
    Equipación CTS.


*/
// =============================================================================

_factionID = "CTS";
_factionName = "Unidad CTS";
_factionStructure = "HIGH-TIER";
_camo = "DS"; //WDL (Multicam Tropic) DS (Multicam Arid) DIG (CTRG Sand) ACU (US ACU) MC (Multicam)

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAMERICAN, _voiceBRITISH];
_defaultFace = [_faceWHITE, _faceBLACK, _faceASIAN];
_defaultName = [_nameAMERICAN];
_defaultInsignia = "CTS";
_defaultColor = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _RHSHK416D145;
_commonRIFLEGL = _RHSHK416D145M320;
_commonPISTOL = _M9;
_commonMG = _M249L;
_commonMARKSMAN = _EMRBlack;
_commonSNIPER = _GM6;
_commonAT = _AT4;
_specAT = _TitanAT;
_specAA = _TitanAA;
_commonSMG = _Vermin;
_commonRCO = _RHSACOG;
_commonCCO = _RHSCCO;
_commonMAGNIFIED = _AMS;
_commonSUPPRESSOR = _RHSsup556;
_commonPISTOLSUPPRESSOR = "";
_NVG = _NVGEN1;

_commonLASER = _RHSlaser;

// AMMO COUNT ==================================================================

_countRIFLE = 6;
_countRIFLELOW = 5;
_countPISTOL = 2;
_countMG = 4;
_countMARKSMAN = 10;
_countSNIPER = 8;
_countAT = 2;
_countGRENADES = 3;
_count40mm = 8;

_commonTracer = _30rnd556STANAGT;
_countTracerRIFLE = 3;
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

_countTOURNIQUET = 14;
_countBANDAGE = 20;
_countMORPHINE = 12;
_countEPI = 6;
_countSALINE = 6;
_countSALINE500 = 4;

_countBandageCARGO = 40;
_countMorphineCARGO = 30;
_countEpiCARGO = 20;
_countBloodbagCARGO = 10;

// UNIFORMS ====================================================================

_headsLIST = [
    "CTS_"+_camo+"_Helmet",
    "CTS_"+_camo+"_Helmet_simple",
    "CTS_"+_camo+"_Helmet_light"
];

_reconheadsLIST = [
	"H_Watchcap_blk",
	"H_Watchcap_khk",
	"CTS_"+_camo+"_booniehat",
	"CTS_"+_camo+"_cap",
	"rhsusf_Bowman",
	"H_Bandanna_khk_hs"
];

_uniformsLIST = [
    "CTS_"+_camo+"_Uniform",
    "CTS_"+_camo+"_Uniform_vest",
    "CTS_"+_camo+"_Uniform_tshirt"
];

_vestsLIST = [
//  "CTS_"+_camo+"_Plate_Carrier2",
//  "CTS_"+_camo+"_Plate_Carrier_H2",
    "CTS_"+_camo+"_Plate_Carrier",
    "CTS_"+_camo+"_Plate_Carrier_H"
];

_goggleLIST = [
  "rhs_googles_clear",
	"G_Combat",
	"G_Aviator",
	"rhs_googles_black"
];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;
_randomReconHEAD = _reconheadsLIST call BIS_fnc_selectRandom;

_commonHEAD = _randomHEAD;
_leaderHEAD = _commonHEAD;
_officerHEAD = "CTS_Beret";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhsusf_cvc_ess";
_pilotHEAD = "CTS_Pilot_Helmet";
_helicrewHEAD = "CTS_HeliPilot_Helmet";
_helipilotHEAD = _helicrewHEAD;
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = _randomReconHEAD;

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "CTS_Pilot_Uniform";
_sniperUNIFORM = "U_B_GhillieSuit";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "CTS_HeliPilot_Uniform";
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

_commonBACKPACK = "CTS_"+_camo+"_Backpack_compact";
_bigBACKPACK = "CTS_"+_camo+"_Backpack_CarryAll";
_medBACKPACK = "CTS_"+_camo+"_Kitbag_compact";

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
/*  Anti Air Vehicles    */      ["B_APC_Tracked_01_AA_F"]
/*  Attack Helos         */	,["B_Heli_Attack_01_F","B_Heli_Light_01_armed_F"]
/*  Attack Planes        */	,["B_Plane_CAS_01_F"]
/*  Heavy Vehicles       */	,["B_MBT_01_cannon_F","B_MBT_01_TUSK_F"]
/*  Light Vehicles       */	,["B_MRAP_01_hmg_F", "B_MRAP_01_hmg_F"]
/*  Medium Vehicles      */	,["B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F"]
/*  Mobile Artillery     */	,["B_MBT_01_arty_F","B_MBT_01_mlrs_F"]
/*  Transport Helos      */	,["B_Heli_Light_01_F","B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F"]
/*  Transport Planes     */	,[]
/*  Transport Trucks     */	,["B_Truck_01_transport_F","B_Truck_01_covered_F"]
/*  Static Defence       */	,["B_HMG_01_high_F","B_static_AA_F","B_static_AT_F","B_Mortar_01_F"]
/*  Boats                */	,["B_Boat_Armed_01_minigun_F"]
/*  UAV                  */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV                  */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support              */	,["B_Truck_01_Repair_F","B_Truck_01_ammo_F","B_Truck_01_fuel_F", "B_Truck_01_medical_F"]
/*  Submarines           */	,["B_SDV_01_F"]
/*  MRAP Vehicles        */     ,["B_MRAP_01_hmg_F", "B_MRAP_01_hmg_F"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_NATO_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_Mil_WallBig_4m_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================

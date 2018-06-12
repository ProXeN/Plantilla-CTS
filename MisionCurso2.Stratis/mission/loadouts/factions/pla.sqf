
// INFO ========================================================================
/*
    In the wake of civil war, the Jerusalem Cease Fire of 2030 mandated the
    creation of an armed defence force to secure the sovereign territory of
    The Republic of Altis and Stratis.
*/

_factionID = "AAF";
_factionName = "AAF Units";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignINDFOR;

_defaultSide = RESISTANCE;
_defaultVoice = [_voiceCHINESE];
_defaultFace = [_faceASIAN];
_defaultName = [_nameCHINESE];
_defaultColor = "green";
_defaultInsignia = "";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _CTAR;
_commonRIFLEGL = _CTARGL;
_commonPISTOL = _Glock;
_commonMG = _CTARS;
_commonMARKSMAN = _QBU88;
_commonSNIPER = _GM6;
_commonAT = _AT4;
_specAT = _PCML;
_commonSMG = _RHSM21S;
_commonRCO = _RHSEOTECH;
_commonCCO = "";
_commonMAGNIFIED = _DMS;
_commonSUPPRESSOR = "";
_commonPISTOLSUPPRESSOR = "";
_NVG = "";

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

_countTracerRIFLE = 2;
_countTracerMG = 1;
_countHE = 1;

_countBandageCARGO = 40;
_countMorphineCARGO = 30;
_countEpiCARGO = 20;
_countBloodbagCARGO = 20;
_countPAKCARGO = 10;

// UNIFORMS ====================================================================

_headsLIST = [
    "FGN_AAF_PASGT_M81",
    "FGN_AAF_PASGT_M81_ESS",
    "FGN_AAF_PASGT_M81_ESS_2",
    "FGN_AAF_PatrolCap_M81"
];

_vestsLIST = [
  "FGN_AAF_BallisticVest_M81",
  "FGN_AAF_BallisticVest_AK_M81",
  "FGN_AAF_M99Vest_M81",
  "FGN_AAF_M99Vest_M81_Rifleman",
  "FGN_AAF_M99Vest_M81_Rifleman_Radio",
  "FGN_AAF_M99Vest_M81_Radio"
];

_uniformLIST = [
    "FGN_FIA_M93_Type99"
];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;
_randomUNIFORM = _uniformLIST call BIS_fnc_selectRandom;

_commonHEAD = _randomHEAD;
_leaderHEAD = _commonHEAD;
_officerHEAD = "FGN_AAF_Beret";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "H_HelmetCrew_I";
_pilotHEAD = "H_PilotHelmetFighter_I";
_helicrewHEAD = "H_CrewHelmetHeli_I";
_helipilotHEAD = "H_PilotHelmetHeli_I";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "H_Booniehat_dgtl";

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "U_I_PilotCoveralls";
_sniperUNIFORM = "U_I_GhillieSuit";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "U_I_PilotCoveralls";
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

_commonBACKPACK = "FGN_AAF_UMTBS_M81";
_bigBACKPACK = "FGN_AAF_FAST_M81";

// EXTRA EQUIPMENT =============================================================

_HMG = "I_HMG_01_A_high_weapon_F";
_HMGTripod = "I_HMG_01_support_F";

_StaticAT = "I_AT_01_weapon_F";
_ATTripod = "I_HMG_01_support_F";

_mortar = "I_Mortar_01_weapon_F";
_mortarTripod = "I_Mortar_01_support_F";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles    */	 ["I_APC_Wheeled_03_cannon_F"]
/*  Attack Helos	 */	,["I_Heli_light_03_F", "I_Heli_light_03_F"]
/*  Attack Planes 	 */	,["I_Plane_Fighter_03_AA_F","I_Plane_Fighter_03_CAS_F"]
/*  Heavy Vehicles 	 */	,["I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F"]
/*  Light Vehicles 	 */	,["I_MRAP_03_hmg_F", "I_MRAP_03_hmg_F"]
/*  Medium Vehicles 	 */	,["I_APC_Wheeled_03_cannon_F","I_APC_Wheeled_03_cannon_F"]
/*  Mobile Artillery     */	,["I_Mortar_01_F"]
/*  Transport Helos      */	,["I_Heli_Transport_02_F","I_Heli_light_03_unarmed_F"]
/*  Transport Planes     */	,[]
/*  Transport Trucks     */	,["I_Truck_02_covered_F","I_Truck_02_transport_F"]
/*  Static Defence 	 */	,["I_HMG_01_high_F","I_static_AA_F","I_static_AT_F","I_Mortar_01_F"]
/*  Boats                */	,["I_Boat_Armed_01_minigun_F"]
/*  UAV                  */	,["I_UAV_02_CAS_F","I_UAV_02_F"]
/*  UGV 		 */	,["I_UGV_01_F","I_UGV_01_rcws_F"]
/*  Support              */	,["I_Truck_02_ammo_F","I_Truck_02_fuel_F", "I_Truck_02_medical_F", "I_Truck_02_box_F"]
/*  Submarines           */	,["I_SDV_01_F"]
/*  MRAP Vehicles        */     ,["I_MRAP_03_hmg_F", "I_MRAP_03_hmg_F"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_AAF_F",
/* Objects      */ ["I_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_BagFence_Long_F"],
/* Structures   */ ["Land_Cargo_HQ_V1_F"]
];

// =============================================================================

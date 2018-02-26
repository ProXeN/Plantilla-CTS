
// INFO ========================================================================
//
//    The structure of a very well equipped army with enough ammo and meds to spare.
//
// =============================================================================

// MEDICAL SUPPLIES ============================================================

switch (true) do {
    case (mission_ACE3_enabled): {
      _suppliesMEDIC = [
        [_tourniquet, _countTOURNIQUET], [_packingBandage,_countBANDAGE], [_elasticbandage, _countBANDAGE],
        [_fieldDressing, _countBANDAGE], [_quickClot, _countBANDAGE], [_morphine,_countMORPHINE],
        [_epi,_countEPI],[_saline250,_countSALINE], [_saline500,_countSALINE500],
        [_personalAidKit,1]
      ];
      _suppliesNORMAL = [[_tourniquet, 2], [_elasticbandage, 6], [_fieldDressing, 4], [_quickClot,7], [_packingBandage, 4], [_morphine,2], [_saline250, 2]];
    };

    default {
      _suppliesMEDIC = [["FirstAidKit",20],["Medikit",1]];
      _suppliesNORMAL = [["FirstAidKit",3]];
    };
};

// =============================================================================
if (!_assignLoadoutMode) exitWith {};
switch (true) do {
// =============================================================================

    case (_isOfficer): {
        [_unit, _officerHEAD, _officerUNIFORM, _officerVEST, "tfw_ilbe_dd_coy"] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_bsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonCCO] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonLASER] call BRM_fnc_attachToWeapon;
        [_unit, _commonTracer, _countTracerRIFLE] call BRM_fnc_addAmmo;
        [_unit, _commonPISTOL, _countPISTOL] call BRM_fnc_addWeaponKit;
        [_unit, "laserdesignator"] call BRM_fnc_addOptics;
        [_unit, [_UAVTerminal]] call BRM_fnc_linkItem;
        [_unit,"ItemcTab",1] call BRM_fnc_addItem;
    };

    case (_isSquadLeader): {
        [_unit, _leaderHEAD, _commonUNIFORM, _slVEST, "tfw_ilbe_dd_coy"] call BRM_fnc_useUniform;
        [_unit,[[_bsmoke,2],[_commonRIFLEGL select GL, _count40mm]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLEGL, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, _commonTracer, _countTracerRIFLE] call BRM_fnc_addAmmo;
        [_unit,[[_40mmSwhite,6],[_40mmSred,6]]] call BRM_fnc_addtoBackpack;
        [_unit,[[_gchemlight,2],[_irGRENADEblufor,1],[_CableTie,1]]] call BRM_fnc_addtoUniform;
        [_unit, _commonPISTOL, _countPISTOL] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonRCO] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonLASER] call BRM_fnc_attachToWeapon;
        [_unit, "laserdesignator"] call BRM_fnc_addOptics;
        [_unit,"ItemcTab",1] call BRM_fnc_addItem;
    };

    case (_isTeamLeader): {
        [_unit, _leaderHEAD, _commonUNIFORM, _ftlVEST, "tfw_ilbe_dd_coy"] call BRM_fnc_useUniform;
        [_unit,[[_bsmoke,2],[_commonRIFLEGL select GL, _count40mm]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLEGL, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, _commonTracer, _countTracerRIFLE] call BRM_fnc_addAmmo;
        [_unit,[[_40mmSwhite,6],[_40mmSred,6]]] call BRM_fnc_addtoBackpack;
        [_unit,[[_gchemlight,2],[_irGRENADEblufor,1],[_CableTie,1]]] call BRM_fnc_addtoUniform;
        [_unit, _commonPISTOL, _countPISTOL] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonRCO] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonLASER] call BRM_fnc_attachToWeapon;
        [_unit, "laserdesignator"] call BRM_fnc_addOptics;
        [_unit,"ItemcTab",1] call BRM_fnc_addItem;
    };

    case (_isReconLeader): {
        [_unit, _reconHEAD, _reconUNIFORM, _reconVEST, "tfw_ilbe_dd_coy"] call BRM_fnc_useUniform;
        [_unit,[[_bsmoke,2],[_gsmoke,2],[_grenade,2],[_irGRENADEblufor,1],[_CableTie,1]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, _commonTracer, _countTracerRIFLE] call BRM_fnc_addAmmo;
        [_unit, _commonPISTOL, _countPISTOL] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonSUPPRESSOR] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonRCO] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonLASER] call BRM_fnc_attachToWeapon;
        [_unit, "handgun", _commonPISTOLSUPPRESSOR] call BRM_fnc_attachToWeapon;
        [_unit, "laserdesignator"] call BRM_fnc_addOptics;
        [_unit,"ItemcTab",1] call BRM_fnc_addItem;
    };

    //Unfinished
    case (_isRTO): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, "empty"] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2], [_grenade,_countGRENADES],[_mapTools,1]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, "laserdesignator"] call BRM_fnc_addOptics;
        [_unit, "BP"] call BRM_fnc_addRadio;
    };

    case (_isRifleman): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, "empty"] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,5],[_gsmoke,2],[_grenade,_countGRENADES],[_gchemlight,2],[_irGRENADEblufor,1],[_CableTie,1]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonCCO] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonLASER] call BRM_fnc_attachToWeapon;
        [_unit, _commonTracer, _countTracerRIFLE] call BRM_fnc_addAmmo;
    };

    case (_isDemo): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _bigBACKPACK] call BRM_fnc_useUniform;
        [_unit, [[_clacker,1],[_mineDetector,1],[_defusalKit,1]]] call BRM_fnc_addtoUniform;
        [_unit,[[_apMINE,2],[_apBoundingMINE,2]]] call BRM_fnc_addtoVest;
        [_unit,[[_C4,3],[_satchelCharge,1],[_deadManSwitch,1]]] call BRM_fnc_addtoBackpack;
        [_unit, _commonRIFLE, _countRIFLELOW] call BRM_fnc_addWeaponKit;
    };

    case (_isRiflemanAT): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _bigBACKPACK] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2], [_rsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonCCO] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonLASER] call BRM_fnc_attachToWeapon;
        [_unit, _commonTracer, _countTracerRIFLE] call BRM_fnc_addAmmo;
        [_unit, _commonAT] call BRM_fnc_addWeapon;
        [_unit, [[_commonAT select RAMMO, _countAT] ]] call BRM_fnc_addtoBackpack;
        [_unit, _commonAT select GUN, 1, ["HE"]] call BRM_fnc_addAmmoAuto;
    };

    case (_isMarksman): {
        [_unit, _commonHEAD, _marksmanUNIFORM, _marksmanVEST, _commonBACKPACK] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2], [_gsmoke,2],[_kestrel,1],[_tragMX,1],[_rangeCard,1]]] call BRM_fnc_addtoVest;
        [_unit,[[_grenade,_countGRENADES],[_gchemlight,2],[_irGRENADEblufor,1],[_CableTie,1]]] call BRM_fnc_addtoBackpack;
        [_unit, _commonMARKSMAN, _countMARKSMAN] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonMAGNIFIED] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _bipodblk] call BRM_fnc_attachToWeapon;
        [_unit, "rangefinder"] call BRM_fnc_addOptics;
    };

    case (_isAutorifleman): {
        [_unit, _commonHEAD, _mgUNIFORM, _mgVEST, _commonBACKPACK] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_grenade,2],[_gchemlight,2],[_irGRENADEblufor,1],[_CableTie,1],[_spareBarrel,1]]] call BRM_fnc_addtoVest;
        [_unit, _commonMG, _countMG] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonCCO] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonLASER] call BRM_fnc_attachToWeapon;
    };

    case (_isAutoriflemanAsst): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _BigBackpack] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_gsmoke,2],[_grenade,2]]] call BRM_fnc_addtoVest;
        [_unit,[[_gchemlight,2],[_irGRENADEblufor,1],[_CableTie,1],[_spareBarrel,1]]] call BRM_fnc_addtoBackpack;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonCCO] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonLASER] call BRM_fnc_attachToWeapon;
        [_unit, (_commonMG select 1), _countMG] call BRM_fnc_addAmmo;
        [_unit, _commonTracer, _countTracerRIFLE] call BRM_fnc_addAmmo;
    };

    //Unfinished
    case (_isGrenadier): {
        [_unit, _commonHEAD, _commonUNIFORM, _grenadierVEST, _commonBACKPACK] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit,[[_commonRIFLEGL select GL, _count40mm]]] call BRM_fnc_addtoBackpack;
        [_unit, _commonRIFLEGL, _countRIFLELOW] call BRM_fnc_addWeaponKit;
    };

    case (_isLifeSaver): {
        [_unit, _medicHEAD, _medicUNIFORM, _medicVEST, _medBACKPACK] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,6], [_gsmoke,6]]] call BRM_fnc_addtoVest;
        [_unit, _suppliesMEDIC] call BRM_fnc_addtoBackpack;
        [_unit, _commonRIFLE, _countRIFLELOW] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonCCO] call BRM_fnc_attachToWeapon;
        _defaultInsignia = "Medico";
    };

    case (_isHMG): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _HMG] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
    };

    case (_isStaticAT): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _StaticAT] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
    };

    case (_isHMGTripod): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _HMGTripod] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
    };

    case (_isATTripod): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _ATTripod] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
    };

    case (_isMortar): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _mortar] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_mapTools,1]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
    };

    case (_isMortarAssistant): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _mortarTripod] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_mapTools,1]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
    };

    case (_isUAVOperator): {
        [_unit, _commonHEAD, _commonUNIFORM, _slVEST, _UAVBag] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke, 2]]] call BRM_fnc_addtoVest;
        [_unit,[["ACE_UAVBattery", 1]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, "laserdesignator"] call BRM_fnc_addOptics;
        [_unit, [_UAVTerminal]] call BRM_fnc_linkItem;
    };

    case (_isRecon): {
        [_unit, _reconHEAD, _reconUNIFORM, _reconVEST, "empty"] call BRM_fnc_useUniform;
        [_unit, "binoc"] call BRM_fnc_addOptics;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_rchemlight,2],[_bchemlight,2],[_wflare,2]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonSUPPRESSOR] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonRCO] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonLASER] call BRM_fnc_attachToWeapon;
        [_unit, "handgun", _commonPISTOLSUPPRESSOR] call BRM_fnc_attachToWeapon;
        [_unit, _commonTracer, _countTracerRIFLE] call BRM_fnc_addAmmo;
    };

    case (_isReconMedic): {
        [_unit, _reconHEAD, _reconUNIFORM, _reconVEST, _medBACKPACK] call BRM_fnc_useUniform;
        [_unit, "binoc"] call BRM_fnc_addOptics;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_gsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit, _suppliesMEDIC] call BRM_fnc_addtoBackpack;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonSUPPRESSOR] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonRCO] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonLASER] call BRM_fnc_attachToWeapon;
        [_unit, "handgun", _commonPISTOLSUPPRESSOR] call BRM_fnc_attachToWeapon;
        [_unit, _commonTracer, _countTracerRIFLE] call BRM_fnc_addAmmo;
        _defaultInsignia = "Medico";
    };

    case (_isReconDemo): {
        [_unit, _reconHEAD, _reconUNIFORM, _reconVEST, _bigBACKPACK] call BRM_fnc_useUniform;
        [_unit, "binoc"] call BRM_fnc_addOptics;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_mapTools,1]]] call BRM_fnc_addtoVest;
        [_unit,[[_C4,3],[_satchelCharge,1],[_deadManSwitch,1],[_clacker,1],[_mineDetector,1],[_defusalKit,1]]] call BRM_fnc_addtoBackpack;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonSUPPRESSOR] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonRCO] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonLASER] call BRM_fnc_attachToWeapon;
        [_unit, "handgun", _commonPISTOLSUPPRESSOR] call BRM_fnc_attachToWeapon;
        [_unit, _commonTracer, _countTracerRIFLE] call BRM_fnc_addAmmo;
    };

    case (_isHeavyAT): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _medBackpack] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_gsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit,[[_gchemlight,2],[_irGRENADEblufor,1],[_CableTie,1]]] call BRM_fnc_addtoBackpack;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonCCO] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonLASER] call BRM_fnc_attachToWeapon;
        [_unit, _specAT, _countAT] call BRM_fnc_addWeaponKit;
    };

	   case (_isATAssistant): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _bigBackpack] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_gsmoke,2],[_grenade,2],[(_commonRIFLE select 2),3],[_gchemlight,2],[_irGRENADEblufor,1],[_CableTie,1]]] call BRM_fnc_addtoVest;
        [_unit, (_specAT select 1), _countAT] call BRM_fnc_addAmmo;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonCCO] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonLASER] call BRM_fnc_attachToWeapon;
    };

    case (_isAA): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _medBackpack] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_gsmoke,2],[_grenade,2]]] call BRM_fnc_addtoVest;
        [_unit, [[(_commonRIFLE select 2),3],[_gchemlight,2],[_irGRENADEblufor,1],[_CableTie,1]]] call BRM_fnc_addtoBackpack;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonCCO] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonLASER] call BRM_fnc_attachToWeapon;
        [_unit, _specAA, _countAT] call BRM_fnc_addWeaponKit;
    };

	   case (_isAAAssistant): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _bigBackpack] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_gsmoke,2],[_grenade,2],[(_commonRIFLE select 2),3],[_gchemlight,2],[_irGRENADEblufor,1],[_CableTie,1]]] call BRM_fnc_addtoVest;
        [_unit, (_specAA select 1), _countAT] call BRM_fnc_addAmmo;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonCCO] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonLASER] call BRM_fnc_attachToWeapon;
    };

    case (_isPilot): {
        [_unit, _pilotHEAD, _pilotUNIFORM, "empty", _parachute] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit, _commonSMG, 2] call BRM_fnc_addWeaponKit;
    };

    case (_isHelicopterCrew): {
        [_unit, _helicrewHEAD, _helicrewUNIFORM, "V_TacVest_blk", _parachute] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_gsmoke,2],[_gchemlight,2],[_irGRENADEblufor,1],[_gFLARE,1]]] call BRM_fnc_addtoVest;
        [_unit, _commonSMG, _countRIFLELOW] call BRM_fnc_addWeaponKit;
    };

    case (_isHelicopterPilot): {
        [_unit, _helipilotHEAD, _helicrewUNIFORM, "V_TacVest_blk", _parachute] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit, _commonSMG, _countRIFLELOW] call BRM_fnc_addWeaponKit;
    };

    case (_isCrewman): {
        [_unit, _crewmanHEAD, _crewUNIFORM, "V_TacVest_blk", "empty"] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit, _commonSMG, _countRIFLELOW] call BRM_fnc_addWeaponKit;
        if (_isLeader) then { [_unit, "BP"] call BRM_fnc_addRadio };
    };

    case (_isSniper): {
        [_unit, _sniperHEAD, _sniperUNIFORM, _commonVEST, "empty"] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_kestrel,1],[_tragMX,1],[_rangeCard,1]]] call BRM_fnc_addtoVest;
        [_unit, _commonSNIPER, _countSNIPER] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonMAGNIFIED] call BRM_fnc_attachToWeapon;
        if (_isLeader) then { [_unit, "BP"] call BRM_fnc_addRadio };
    };

    case (_isSpotter): {
        [_unit, _sniperHEAD, _sniperUNIFORM, _commonVEST, _commonBACKPACK] call BRM_fnc_useUniform;
        if (_isLeader) then { [_unit, "BP"] call BRM_fnc_addRadio };
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_tragMX,1],[_rangeCard,1],[_kestrel,1]]] call BRM_fnc_addtoVest;
        [_unit,[[_commonSNIPER select RAMMO, (_countSNIPER)]]] call BRM_fnc_addtoBackpack;
        [_unit, _commonRIFLE, _countRIFLELOW] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonSUPPRESSOR] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonRCO] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonLASER] call BRM_fnc_attachToWeapon;
        [_unit, "laserdesignator"] call BRM_fnc_addOptics;
    };

    default {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, "empty"] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_grenade,3]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, 6] call BRM_fnc_addWeaponKit;
    };
};

// ADDS ESSENTIALS =============================================================

[_unit, _suppliesNORMAL] call BRM_fnc_addtoUniform;

[_unit,_mapTools,1] call BRM_fnc_addItem;
[_unit,_microDAGR,1] call BRM_fnc_addItem;
[_unit,_flashlight,1] call BRM_fnc_addItem;
[_unit,"ItemcTabHCam",1] call BRM_fnc_addItem;

if (_isPilot) then {
[_unit, ["ItemMap", "ItemCompass", "ItemWatch"]] call BRM_fnc_linkItem;
} else {
[_unit, ["ItemMap", "ItemCompass", "ItemWatch", _NVG]] call BRM_fnc_linkItem;
};

[_unit, "LR"] call BRM_fnc_addRadio;

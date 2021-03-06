
switch(_x) do {
    case "medical":
    {
        [[_object, "magazine",
            [_bchemlight, 25],
            [_rchemlight, 25],
            [_gchemlight, 25],
            [_wsmoke, 25],
            [_rsmoke, 25],
            [_gsmoke, 25]
        ]] call BRM_fnc_addtoCargo;
        [[_object, "item",
            [_bandage, _countBandageCARGO],
            [_morphine, _countMorphineCARGO],
            [_epi, _countEpiCARGO],
            [_bloodbag, _countBloodbagCARGO]
        ]] call BRM_fnc_addtoCargo;
    };
    case "medical_adv":
    {
        if (mission_ACE3_enabled) then {
            [[_object, "item",
                [_fieldDressing, _countBandageCARGO],
                [_packingBandage, _countBandageCARGO],
                [_elasticBandage, _countBandageCARGO],
                [_personalAidKit, _countPAKCARGO],
                [_quickClot, _countBandageCARGO],
                [_tourniquet, _countBandageCARGO],
                [_morphine, _countMorphineCARGO],
                [_atrophine, _countMorphineCARGO],
                [_epi, _countEpiCARGO],
                [_saline1000, _countBloodbagCARGO],
                [_blood1000, _countBloodbagCARGO],
                [_plasma1000, _countBloodbagCARGO],
                [_surgKit, 5],
                [_defib, 5],
                [_bodyBag, _countBloodbagCARGO]
            ]] call BRM_fnc_addtoCargo;
        };
    };
    case "ammo":
    {
        [[_object, "magazine",
            [_commonRIFLE select RAMMO,_countRifleCARGO],
            [_commonMG select RAMMO, _countMGCARGO],
            [_commonMARKSMAN select RAMMO,_countRifleCARGO],
            [_commonSNIPER select RAMMO,_countSNIPERCARGO],
            [_commonSMG select RAMMO,_countRifleCARGO],
            [_specAT select RAMMO, _countATCARGO],
            [_commonRIFLEGL select GL, _count40mmCARGO],
            [_grenade, _countGRENADESCARGO],
            [_wsmoke, 25],
            [_rsmoke, 25],
            [_gsmoke, 25]
        ]] call BRM_fnc_addtoCargo;
        [[_object, "item",
            [_earBuds, 25]
        ]] call BRM_fnc_addtoCargo;
    };

    case "ammo_big":
    {
        [[_object,"magazine",
            [_commonRIFLE select RAMMO,_countRifleCARGO * 3],
            [_commonMG select RAMMO, _countMGCARGO * 3],
            [_commonMARKSMAN select RAMMO,_countRifleCARGO * 3],
            [_commonSNIPER select RAMMO,_countSNIPERCARGO * 3],
            [_commonSMG select RAMMO,_countRifleCARGO * 3],
            [_specAT select RAMMO, _countATCARGO * 3],
            [_commonRIFLEGL select GL, _count40mmCARGO * 3],
            [_grenade, _countGRENADESCARGO * 3],
            [_wsmoke, 25 * 3],
            [_rsmoke, 25 * 3],
            [_gsmoke, 25 * 3]
        ]] call BRM_fnc_addtoCargo;
    };

    case "at":
    {
        [[_object,"magazine",
            [_specAT select RAMMO,_countATCARGO]
        ]] call BRM_fnc_addtoCargo;
        [[_object,"weapon",
            [_specAT select GUN, 3]
        ]] call BRM_fnc_addtoCargo;
    };

    case "radio": {
        [_object, "LR", _factionSide, 20] call BRM_fnc_addRadioToCargo;
        [[_object,"backpack", ["tfw_ilbe_dd_coy" , 5]]] call BRM_fnc_addtoCargo;
        [[_object,"backpack", ["tfw_ilbe_dd_gr" , 5]]] call BRM_fnc_addtoCargo;
    };

    case "parachutes": {
        [[_object,"backpack",
            [_parachute , 15]
        ]] call BRM_fnc_addtoCargo;
    };

    case "explosives": {
        [[_object,"item",
            [_SLAM, 30],
            [_C4, 30],
            [_satchelCharge, 30],
            [_breachingCharge, 30],
            [_APERSDispenser, 30],
            [_demoCharge, 30],
            [_APERS, 30],
            [_Claymore, 30]

        ]] call BRM_fnc_addtoCargo;
    };
};

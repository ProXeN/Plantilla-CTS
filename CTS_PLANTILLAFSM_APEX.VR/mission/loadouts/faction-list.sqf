switch (toUpper(_faction)) do {

    case "CTS": {
        #include "factions\CTS.sqf"
    };

    case "RACS": {
        #include "factions\racs.sqf"
    };

    case "SLA": {
        #include "factions\sla.sqf"
    };

    case "MUJAHIDEEN": {
        #include "factions\mujahideen.sqf"
    };

    case "CHEDAKI": {
        #include "factions\chedaki.sqf"
    };

    case "USARMY": {
	      #include "factions\usarmy.sqf"
    };

    case "MARINES": {
        #include "factions\marines.sqf"
    };

    case "VDV": {
        #include "factions\vdv.sqf"
    };

    case "IONPMC": {
        #include "factions\ionpmc.sqf"
    };

    case "TKMILITIA": {
        #include "factions\tkmilitia.sqf"
    };

    case "ANA": {
        #include "factions\ana.sqf"
    };

    case "CSAT": {
        #include "factions\csat.sqf"
    };

    case "CSATPACIFIC": {
        #include "factions\csatpacific.sqf"
    };

    case "NATO": {
        #include "factions\nato.sqf"
    };

    case "AAF": {
        #include "factions\aaf.sqf"
    };

    case "FIA": {
        #include "factions\fia.sqf"
    };

    case "SYNDIKAT": {
        #include "factions\syndikat.sqf"
    };

    case "MOLATIAN": {
        #include "factions\molatian.sqf"
    };

    case "UN": {
        #include "factions\un.sqf"
    };

    case "TKARMY": {
        #include "factions\tkarmy.sqf"
    };

    case "RUSSIA": {
        #include "factions\russia.sqf"
    };

    case "CDF": {
        #include "factions\cdf.sqf"
    };

    case "OFPFIA": {
        #include "factions\ofpfia.sqf"
    };

    case "DEFAULT": {
        #include "factions\template.sqf"
    };

    default {
        #include "factions\template.sqf"
    };
};

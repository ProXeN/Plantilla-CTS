switch (toUpper(_faction)) do {

    case "CTSMC": {
        #include "factions\CTSMC.sqf"
    };

    case "CTSMCA": {
        #include "factions\CTSMCA.sqf"
    };

    case "CTSMCT": {
        #include "factions\CTSMCT.sqf"
    };

    case "RACS": {
        #include "factions\racs.sqf"
    };

    case "SLA": {
        #include "factions\sla.sqf"
    };

    case "ISIS": {
        #include "factions\isis.sqf"
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

    case "AAF2017": {
        #include "factions\aaf2017.sqf"
    };

    case "PLA": {
        #include "factions\pla.sqf"
    };

    case "FIA": {
        #include "factions\fia.sqf"
    };

    case "GUERRILLA": {
        #include "factions\guerrilla.sqf"
    };

    case "SYNDIKAT": {
        #include "factions\syndikat.sqf"
    };

    case "RUSSIA": {
        #include "factions\russia.sqf"
    };

    case "CDF": {
        #include "factions\cdf.sqf"
    };

    case "DEFAULT": {
        #include "factions\template.sqf"
    };

    default {
        #include "factions\template.sqf"
    };
};

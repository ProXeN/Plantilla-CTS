
switch (toUpper(_factionStructure)) do {
    case "CTS": {
        #include "factions\structures\CTS.sqf"
    };

    case "CTSOD": {
        #include "factions\structures\CTSOD.sqf"
    };

    case "HIGH-TIER": {
        #include "factions\structures\high_tier_army.sqf"
    };

    case "MID-TIER": {
        #include "factions\structures\mid_tier_army.sqf"
    };

    case "LOW-TIER": {
        #include "factions\structures\low_tier_army.sqf"
    };

    default {
        #include "factions\structures\high_tier_army.sqf"
    };
};

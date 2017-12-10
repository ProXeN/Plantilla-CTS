private ["_winningSides","_losingSides","_title","_reason","_showStats","_endNumber"];

switch (_this select 0) do {

// ============================================================================
//             ENDING FOR WHEN THE PLAYERS WIN A COOP MISSION                  |
// ============================================================================
    case "victory":
    {
        _winningSides = [side_a_side];
        _losingSides = [side_b_side, side_c_side];
        _showStats = false;
        _title = "Misión Cumplida";
        _reason = "%1 ha completado todos los objetivos";
        _endNumber = 1;
    };

// ============================================================================
//                    ... AND FOR WHEN THEY DON'T                              |
// ============================================================================
    case "defeat":
    {
        _winningSides = [side_b_side, side_c_side];
        _losingSides = [side_a_side];
        _showStats = false;
        _title = "Misión Fallida.";
        _reason = "%2 ha fracrasado.";
        _endNumber = 2;
    };

// ============================================================================
//                            CUSTOM ENDING                                    |
// ============================================================================
    case "custom":
    {
        _winningSides = [side_a_side,side_b_side,side_c_side];
        _losingSides = [side_a_side,side_b_side,side_c_side];
        _showStats = false;
        _title = "The mission is over, maybe?";
        _reason = "%1 defeated %2.";
        _endNumber = 1;
    };
};

// =============================================================================

// =============================================================================
if !(mission_enable_side_c) then {
    _winningSides = _winningSides - [side_c_side];
    _losingSides = _losingSides - [side_c_side];
};
mission_ending_details = [_winningSides, _losingSides, _showStats, _title, _reason, _endNumber];
publicVariable "mission_ending_details";
// =============================================================================

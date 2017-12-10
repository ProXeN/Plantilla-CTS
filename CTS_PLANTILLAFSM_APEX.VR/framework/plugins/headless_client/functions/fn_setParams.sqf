
// =============================================================================
//  Headless Client parameters
// =============================================================================

_param_hc_enabled = ["p_enable_hc", 1] call BIS_fnc_getParamValue;
switch (_param_hc_enabled) do {
    case 0: { mission_enable_hc = false };
    case 1: { mission_enable_hc = true };
};

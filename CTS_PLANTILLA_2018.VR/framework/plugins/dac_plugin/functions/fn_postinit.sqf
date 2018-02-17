
#include "includes\settings.sqf"

if (mission_AI_controller) then {
    _center = createCenter sideLogic; _group = createGroup _center;
    DAC_module = _group createUnit ["DAC_Source_Extern", [0,0,0],[], 1,"NONE"];
    publicVariable "DAC_module";

    DAC_module_Support = _group createUnit ["DAC_Support_Logic", [0,0,0],[], 1,"NONE"];
    publicVariable "DAC_module_Support";
};

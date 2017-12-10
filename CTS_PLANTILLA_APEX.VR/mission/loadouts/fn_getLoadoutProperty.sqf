
params ["_faction"];

#include "includes\private-variables.sqf"
#include "content\content-list.sqf"
#include "includes\faction-info-index.sqf"

_assignLoadoutMode = false;

// READ LOADOUT DATA ===========================================================

#include "read-data.sqf"

// =============================================================================

_ret = [];

#include "includes\return-properties.sqf"

_ret

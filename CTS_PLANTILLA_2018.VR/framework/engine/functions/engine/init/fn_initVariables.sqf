/*
================================================================================

NAME:
    BRM_fnc_initVariables

AUTHOR(s):
    Nife

DESCRIPTION:
    Initializes all environment variables related to the Framework, such as
    units, groups, object arrays and settings.

PARAMETERS:
    None.

USAGE:
    [] call BRM_fnc_initVariables;

RETURNS:
    Nothing.

================================================================================
*/

if (isNil "mission_players") then { mission_players = [] };

if (isNil "mission_running") then { mission_running = true };
if (isNil "mission_groups_init") then { mission_groups_init = false };

if (isNil "mission_AI_controller") then { mission_AI_controller = false };
if (isNil "mission_enable_hc") then { mission_enable_hc = false };

if (isNil "mission_ACE3_enabled") then { mission_ACE3_enabled = (isClass(configFile>>"CfgPatches">>"ACE_COMMON")) };

if (isNil "mission_TFAR_enabled") then { mission_TFAR_enabled = (isClass(configFile>>"CfgPatches">>"task_force_radio")) };

// ============================================================================
//         Initializes all playable units whether they exist or not.           |
// ============================================================================

if(isNil"blu_0_0_1")then{blu_0_0_1=objNull}; if(isNil"blu_0_0_2")then{blu_0_0_2=objNull}; if(isNil"blu_0_0_3")then{blu_0_0_3=objNull};

if(isNil"blu_1_0_1")then{blu_1_0_1=objNull}; if(isNil"blu_1_0_2")then{blu_1_0_2=objNull};
if(isNil"blu_1_0_3")then{blu_1_0_3=objNull}; if(isNil"blu_1_0_4")then{blu_1_0_4=objNull};
if(isNil"blu_1_0_5")then{blu_1_0_5=objNull}; if(isNil"blu_1_0_6")then{blu_1_0_6=objNull};
if(isNil"blu_1_1_1")then{blu_1_1_1=objNull}; if(isNil"blu_1_1_2")then{blu_1_1_2=objNull};
if(isNil"blu_1_1_3")then{blu_1_1_3=objNull}; if(isNil"blu_1_1_4")then{blu_1_1_4=objNull};
if(isNil"blu_1_2_1")then{blu_1_2_1=objNull}; if(isNil"blu_1_2_2")then{blu_1_2_2=objNull};
if(isNil"blu_1_2_3")then{blu_1_2_3=objNull}; if(isNil"blu_1_2_4")then{blu_1_2_4=objNull};

if(isNil"blu_2_0_1")then{blu_2_0_1=objNull}; if(isNil"blu_2_0_2")then{blu_2_0_2=objNull};
if(isNil"blu_2_0_3")then{blu_2_0_3=objNull}; if(isNil"blu_2_0_4")then{blu_2_0_4=objNull};
if(isNil"blu_2_0_5")then{blu_2_0_5=objNull}; if(isNil"blu_2_0_6")then{blu_2_0_6=objNull};
if(isNil"blu_2_1_1")then{blu_2_1_1=objNull}; if(isNil"blu_2_1_2")then{blu_2_1_2=objNull};
if(isNil"blu_2_1_3")then{blu_2_1_3=objNull}; if(isNil"blu_2_1_4")then{blu_2_1_4=objNull};
if(isNil"blu_2_2_1")then{blu_2_2_1=objNull}; if(isNil"blu_2_2_2")then{blu_2_2_2=objNull};
if(isNil"blu_2_2_3")then{blu_2_2_3=objNull}; if(isNil"blu_2_2_4")then{blu_2_2_4=objNull};

if(isNil"blu_3_0_1")then{blu_3_0_1=objNull}; if(isNil"blu_3_0_2")then{blu_3_0_2=objNull};
if(isNil"blu_3_0_3")then{blu_3_0_3=objNull}; if(isNil"blu_3_0_4")then{blu_3_0_4=objNull};
if(isNil"blu_3_0_5")then{blu_3_0_5=objNull}; if(isNil"blu_3_0_6")then{blu_3_0_6=objNull};
if(isNil"blu_3_1_1")then{blu_3_1_1=objNull}; if(isNil"blu_3_1_2")then{blu_3_1_2=objNull};
if(isNil"blu_3_1_3")then{blu_3_1_3=objNull}; if(isNil"blu_3_1_4")then{blu_3_1_4=objNull};
if(isNil"blu_3_2_1")then{blu_3_2_1=objNull}; if(isNil"blu_3_2_2")then{blu_3_2_2=objNull};
if(isNil"blu_3_2_3")then{blu_3_2_3=objNull}; if(isNil"blu_3_2_4")then{blu_3_2_4=objNull};

if(isNil"blu_4_0_1")then{blu_4_0_1=objNull}; if(isNil"blu_4_0_2")then{blu_4_0_2=objNull};
if(isNil"blu_4_0_3")then{blu_4_0_3=objNull}; if(isNil"blu_4_0_4")then{blu_4_0_4=objNull};
if(isNil"blu_4_0_5")then{blu_4_0_5=objNull}; if(isNil"blu_4_0_6")then{blu_4_0_6=objNull};
if(isNil"blu_4_1_1")then{blu_4_1_1=objNull}; if(isNil"blu_4_1_2")then{blu_4_1_2=objNull};
if(isNil"blu_4_1_3")then{blu_4_1_3=objNull}; if(isNil"blu_4_1_4")then{blu_4_1_4=objNull};
if(isNil"blu_4_2_1")then{blu_4_2_1=objNull}; if(isNil"blu_4_2_2")then{blu_4_2_2=objNull};
if(isNil"blu_4_2_3")then{blu_4_2_3=objNull}; if(isNil"blu_4_2_4")then{blu_4_2_4=objNull};

if(isNil"blu_5_0_1")then{blu_5_0_1=objNull}; if(isNil"blu_5_0_2")then{blu_5_0_2=objNull};
if(isNil"blu_5_0_3")then{blu_5_0_3=objNull}; if(isNil"blu_5_0_4")then{blu_5_0_4=objNull};
if(isNil"blu_5_0_5")then{blu_5_0_5=objNull};

if(isNil"blu_6_0_1")then{blu_6_0_1=objNull}; if(isNil"blu_6_0_2")then{blu_6_0_2=objNull};
if(isNil"blu_6_0_3")then{blu_6_0_3=objNull}; if(isNil"blu_6_0_4")then{blu_6_0_4=objNull};

if(isNil"blu_7_0_1")then{blu_7_0_1=objNull}; if(isNil"blu_7_0_2")then{blu_7_0_2=objNull};
if(isNil"blu_7_0_3")then{blu_7_0_3=objNull}; if(isNil"blu_7_0_4")then{blu_7_0_4=objNull};

if(isNil"blu_8_0_1")then{blu_8_0_1=objNull}; if(isNil"blu_8_0_2")then{blu_8_0_2=objNull};
if(isNil"blu_8_0_3")then{blu_8_0_3=objNull};

if(isNil"blu_9_0_1")then{blu_9_0_1=objNull}; if(isNil"blu_9_0_2")then{blu_9_0_2=objNull};
if(isNil"blu_9_0_3")then{blu_9_0_3=objNull}; if(isNil"blu_9_0_4")then{blu_9_0_4=objNull};

if(isNil"blu_10_0_1")then{blu_10_0_1=objNull}; if(isNil"blu_10_0_2")then{blu_10_0_2=objNull};
if(isNil"blu_10_0_3")then{blu_10_0_3=objNull}; if(isNil"blu_10_0_4")then{blu_10_0_4=objNull};


// ============================================================================
//          Initializes all possible groups whether they exist or not.         |
// ============================================================================

if(isNil"blu_0_0")then{blu_0_0=grpNull};
if(isNil"blu_1_0")then{blu_1_0=grpNull}; if(isNil"blu_1_1")then{blu_1_1=grpNull}; if(isNil"blu_1_2")then{blu_1_2=grpNull};
if(isNil"blu_2_0")then{blu_2_0=grpNull}; if(isNil"blu_2_1")then{blu_2_1=grpNull}; if(isNil"blu_2_2")then{blu_2_2=grpNull};
if(isNil"blu_3_0")then{blu_3_0=grpNull}; if(isNil"blu_3_1")then{blu_3_1=grpNull}; if(isNil"blu_3_2")then{blu_3_2=grpNull};
if(isNil"blu_4_0")then{blu_4_0=grpNull}; if(isNil"blu_4_1")then{blu_4_1=grpNull}; if(isNil"blu_4_2")then{blu_4_2=grpNull};

if(isNil"blu_5_0")then{blu_5_0=grpNull}; if(isNil"blu_6_0")then{blu_6_0=grpNull}; if(isNil"blu_7_0")then{blu_7_0=grpNull};
if(isNil"blu_8_0")then{blu_8_0=grpNull}; if(isNil"blu_9_0")then{blu_9_0=grpNull}; if(isNil"blu_10_0")then{blu_10_0=grpNull};

// =============================================================================

// =============================================================================
//                          WEAPON ACCESSORIES LIST
// =============================================================================

// =============================================================================

// VANILLA

// Suppressors

_sup65 = "muzzle_snds_H";
_sup9mm = "muzzle_snds_L";
_sup45 = "muzzle_snds_acp";
_sup556 = "muzzle_snds_M";
_sup762 = "muzzle_snds_B";
_supLMG = "muzzle_snds_H_MG";
_sup93 = "muzzle_snds_93mmg_tan";
_sup338 = "muzzle_snds_338_sand";
_sup58 = "muzzle_snds_58_ghex_F";

// Scopes

_ARCO = "optic_Arco";
_RCO = "optic_Hamr";
_MRCO = "optic_MRCO";
_ACOred = "optic_Aco";
_ACOgreen = "optic_ACO_grn";
_EOT = "optic_Holosight";
_NVS = "optic_NVS";
_Nightstalker = "optic_Nightstalker";
_SOS = "optic_SOS";
_TWS = "optic_tws";
_TWSmg = "optic_tws_mg";
_AMS = "optic_AMS";

// Flashlights/Lasers

_flashlight = "acc_flashlight";
_laser = "acc_pointer_IR";

// Bipods

_bipodBLU = "bipod_01_F_snd";
_bipodOP = "bipod_02_F_hex";
_bipodIND = "bipod_03_F_oli";
_bipodblk = "bipod_01_F_blk";

// =============================================================================

// APEX

// Scopes
_ARCOblk = "optic_Arco_blk_F";
_ARCOghex = "optic_Arco_ghex_F";
_DMSgHex = "optic_DMS_ghex_F";

// Suppressors

_sup58ghex =  "muzzle_snds_58_ghex_F";

// =============================================================================

// FHQ

// Scopes

_FHQACOG = "FHQ_optic_ACOG";
_FHQACOGTAN = "FHQ_optic_ACOG_tan";
_FHQAIMPOINT = "FHQ_optic_AIM";
_FHQAIMPOINTTAN = "FHQ_optic_AIM_tan";
_FHQTWS = "FHQ_optic_TWS3050";
_FHQHWS = "FHQ_optic_HWS";
_FHQHWSTAN = "FHQ_optic_HWS_tan";
_FHQEOTECH = "FHQ_optic_HWS_G33";
_FHQEOTECHTAN = "FHQ_optic_HWS_G33_tan";
_FHQMICROCCO = "FHQ_optic_MicroCCO";
_FHQMICROCCOTAN = "FHQ_optic_MicroCCO_tan";
_FHQMICROCCOLOW = "FHQ_optic_MicroCCO_low";
_FHQMICROCCOLOWTAN = "FHQ_optic_MicroCCO_low_tan";
_FHQLEOPOLD = "FHQ_optic_LeupoldERT";
_FHQLEOPOLDTAN = "FHQ_optic_LeupoldERT_tan";
_FHQVCOG = "FHQ_optic_VCOG";
_FHQVCOGTAN = "FHQ_optic_VCOG_tan";
_FHQAC117 = "FHQ_optic_AC11704";
_FHQAC117TAN = "FHQ_optic_AC11704_tan";
_FHQAC121 = "FHQ_optic_AC12136";
_FHQAC121TAN = "FHQ_optic_AC12136_tan";
_FHQMARS = "FHQ_optic_MARS";
_FHQMARSTAN = "FHQ_optic_MARS_tan";

// Flashlights/Lasers

_FHQANPE = "FHQ_acc_ANPEQ15";
_FHQANPEBLK = "FHQ_acc_ANPEQ15_black";
_FHQLLM = "FHQ_acc_LLM01L";

// =============================================================================

// RHS

// Scopes
_RHSACOG = "rhsusf_acc_ACOG3";
_RHSCCO = "rhsusf_acc_compm4";

// Suppressors
_RHSsup556 = "rhsusf_acc_nt4_black";

// Lasers
_RHSlaser = "rhsusf_acc_anpeq15side_bk";
// =============================================================================

// SMA

// Scopes
_SMASpecterBlack = "sma_elcan_specter_rds_4z";
_SMASpecterTan = "sma_elcan_specter_tan_rds_4z";
_SMASpecterGreen = "sma_elcan_specter_green_rds_4z";


// NIGHT-VISION

_PVS14 = "rhsusf_ANPVS_14";
_PVS15 = "rhsusf_ANPVS_15";
_CSATNV = "O_NVGoggles_hex_F";
_CSATNVghex = "O_NVGoggles_ghex_F";

switch (true) do {
    case (mission_ACE3_enabled): {
        _NVGEN1 = "ACE_NVG_Gen1";
        _NVGEN2 = "ACE_NVG_Gen2";
        _NVGEN4 = "ACE_NVG_Gen4";
        _NVWIDE = "ACE_NVG_Wide";
        _LRPS = "ACE_optic_LRPS_2D";
        _SOS = "ACE_optic_SOS_2D";
    };
    default {
        _NVGEN1 = "NVGoggles";
        _NVGEN2 = "NVGoggles";
        _NVGEN4 = "NVGoggles";
        _NVWIDE = "NVGoggles";
    };
};

_NVGEN3OP = "NVGoggles_OPFOR";
_NVGEN3IND = "NVGoggles_INDEP";
_NVGEN3BLU = "NVGoggles";

// =============================================================================

// OTHERS

_parachute = "B_Parachute";

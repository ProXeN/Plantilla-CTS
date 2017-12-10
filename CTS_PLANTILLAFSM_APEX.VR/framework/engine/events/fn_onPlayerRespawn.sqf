// ============================================================================
//                                                                             |
//          EVENT SCRIPT: Executes whenever a player unit respawns.            |
//                                                                             |
// ============================================================================

// 0 spawn {
    // titletext ["Iniciando modo espectador...", "BLACK FADED",0];
    // sleep 3;
    // titletext ["", "PLAIN",0];
// };

removeVest player;
removeHeadgear player;
removeBackpack player;
removeGoggles player;
removeUniform player;
removeAllItems player;
removeAllWeapons player;

player enablesimulation false;
player allowDamage false;
player setPos [0,0,10];
player setVariable ["tf_unable_to_use_radio", true];

[player] joinSilent grpnull;

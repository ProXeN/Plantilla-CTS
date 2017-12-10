//=======================================================================================================//
// Mission configuration.                                                                                //
//=======================================================================================================//

// ACRE2: Configure ACRE2.
//        - BABEL:
//            * false: Deactivate babel between sides.
//            * true: Activate babel between sides.
//        - RADIOS:
//            * false: Channels are set-up equally per side.
//            * true: Channels are set-up differently per side.
[true, true] call acre_api_fnc_setupMission;

// ACRE2: Allow AI detect players when they speak.
//        - false: AI cannot listen to players.
//        - true: AI can listen to, and therefore detect players using a inverse quadratic model.
[true, true] call acre_api_fnc_setRevealToAI;

//=======================================================================================================//
// Difficulty configuration.                                                                             //
//=======================================================================================================//

// ACRE2: Loss of signal due to terrain. Value between 0 and 1.
//        - 0: Deactivates loss of signal due to terrain.
//        - 1: Loss of signal totally simulated.
[1, true] call acre_api_fnc_setLossModelScale;

// ACRE2: Duplex
//        - false: Transmissions will not be received when radio is transmitting.
//        - true: Transmission will be received when transmitting.
[false, true] call acre_api_fnc_setFullDuplex;

// ACRE2: Interference.
//        - false: radio interference will not be modelled when two players transmit on the same frequency.
//        - true: interferences will be modelled when simultaneously transmitting on the same frequency.
[true, true] call acre_api_fnc_setInterference;

// ACRE2: Antena direction
//        - false: antena direction is simulated.
//        - true: the signal simulation model ignores antena direction.
[false, true] call acre_api_fnc_ignoreAntennaDirection;

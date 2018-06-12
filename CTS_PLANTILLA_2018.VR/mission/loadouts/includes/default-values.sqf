
if (isNil "_defaultSide") then { _defaultSide = WEST };
if (isNil "_defaultFace") then { _defaultFace = _faceWHITE };
if (isNil "_defaultVoice") then { _defaultVoice = _voiceAMERICAN };
if (isNil "_defaultInsignia") then { _defaultInsignia = "none" };

_defaultCallsignBLUFOR =
["Zero", "Raptor", "Hornet", "Arrow", "Breacher", "Razor", "Foxtrot", "Titan", "Lancer", "Sabre", "Spartan"];

_defaultCallsignOPFOR =
["Godfather", "Anaconda", "Boa", "Cobra", "Dragon", "Raven", "Scorpion", "Weasel", "Sparrow", "Pelican", "Moose"];

_defaultCallsignINDFOR =
["Papa", "Anna", "Beatrice", "Clara", "Denise", "Rose", "Sarah", "Whitney", "Shirley", "Penny", "Mary"];

_sideC = "B";

switch (_defaultSide) do {
    case WEST: { _sideC = "B" };
    case EAST: { _sideC = "O" };
    case RESISTANCE: { _sideC = "I" };
};

if (isNil "_factionSkill") then {
/*                  "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
    _factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];
};

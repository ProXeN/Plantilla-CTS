
_ret set [FACTION_INFO, []];
(_ret select FACTION_INFO) set [FACTION_SIDE, _defaultSide];
(_ret select FACTION_INFO) set [FACTION_NAME, _factionName];
(_ret select FACTION_INFO) set [FACTION_CALLSIGNS, _factionCallsigns];
(_ret select FACTION_INFO) set [FACTION_SKILL, _factionSkill];

if ((count _this) > 1) then {
    switch toUpper(_this select 1) do {
        case "SIDE": { _ret = _defaultSide };
        case "NAME": { _ret = _factionName };
        case "SKILL": { _ret = _factionSkill };
        case "CALLSIGNS": { _ret = _factionCallsigns };
    };
};

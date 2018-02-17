
if (!(isPlayer _unit)) then { _type = typeOf _unit }
else {
    if ( (count _this) > 2) then {
        _type = _this select 2;
    } else {
        _type = typeOf _unit;
    };
};

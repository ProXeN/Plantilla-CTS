if !(hasInterface) exitWith {};

0 spawn {
if (isNull player) then {waitUntil{!isNull player}};

waitUntil{(mission_groups_init)};

private ["_orbatText", "_groups"];
_groups = [];
_hiddenGroups = [];

{
    if ((side _x == side group player) && (isPlayer (leader _x)) && !(_x in _groups) && ((count units _x) > 0)) then {
        _groups pushBack _x;
    };
} forEach allGroups;

_groups = _groups - _hiddenGroups;
_orbatText = "";
_orbatText = "<font size='18'>CTS</font><br/><font size='16'>Fuerzas Desplegadas</font><br/><br/><font size='14' color='#d7dbd5'>Frecuencias de Radio</font><br/><font color='#FF9E05'>NARANJA</font><font color='#9DA698'> = Frecuencia de radio de largo alcance del grupo.<br/><font color='#10D471'>VERDE</font><font color='#9DA698'> = Frecuencia de radio de onda corta del grupo.</font><br/><br/>";
{
    _checkin = false;
    {
        if (isPlayer _x) exitWith {_checkin = true};
    } forEach units _x;
    if (!isMultiplayer) then { _checkin = true };
    if (_checkin) then {

		_CTS_Group = [groupID (_x)," "] call BIS_fnc_splitstring;
        _CTS_GroupID = (_CTS_Group) select 0;
		_leader = [str(leader _x),"_"] call BIS_fnc_splitstring;
        _i = parseNumber (_leader select 1);
        //if (_i == -1) exitWith {systemChat "Error";};

        _CTS_Preset = [CTSfreqs select _i, []] select (_i < 0);
		_CTS_Subgroup = parseNumber (_leader select 2);

		if (_CTS_Subgroup == 0) then {
			CTS_Group_SW_freq = _CTS_Preset select 1;
			CTS_Group_LR_freq = _CTS_Preset select 0;
		} else {
			CTS_Group_SW_freq = (_CTS_Preset select 1) + _CTS_Subgroup;
			CTS_Group_LR_freq = _CTS_Preset select 1;
		};
        _orbatText = _orbatText + format["<br/><font size='16' color='#D7DBD5'>Equipo %1</font> ",(groupID _x)];
        _orbatText = _orbatText + format["<font color='#9DA698'>[</font><font color='#FF9E05'>%1</font><font color='#9DA698'>][</font><font color='#10D471'>%2</font><font color='#9DA698'>]<br/>",CTS_Group_LR_freq,CTS_Group_SW_freq];
        {
            private["_padding","_playerdesc","_playerLeader","_sign","_rank"];
            _player = _x;

            _color = (_x getVariable ["unitInit", ["white"]]) select 0;

            _color = [_color] call BRM_fnc_colorToHex;

            _playerdesc = [str(_player), "_", " "] call CBA_fnc_replace;
            _playerLeader = isFormationLeader _player;
            _isMedic = getNumber (configFile >> "cfgVehicles" >> typeOf _x >> "attendant");

            if (_playerLeader) then { _padding = "" } else { _padding = "     " };
            if (_IsMedic == 1) then { _sign = " (<img image='framework\plugins\team_roster\assets\med_icon.paa' width='16' heigth='16' />)" } else { _sign = "" };

            switch (rankID _x) do {
                case 0: {_rank = "Sdo. "};
                case 1: {_rank = "Cbo. "};
                case 2: {_rank = "Sgt. "};
                case 3: {_rank = "Tnt. "};
                case 4: {_rank = "Cpt. "};
                case 5: {_rank = "May. "};
                case 6: {_rank = "Cor. "};
                default {_rank = "" };
            };

            _playerdesc = _player getVariable ["rosterAlias", _playerdesc];
            _orbatText = _orbatText + format["%1%2<font color='%6'>%3</font> (%4)%5", _padding,_rank, name _x, _playerdesc,_sign,_color] + "<br />";
        } forEach units _x;
    };
} forEach _groups;

player createDiaryRecord ["Diary", ["Fuerzas Desplegadas", _orbatText]];
};

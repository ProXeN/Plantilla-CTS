if (!hasinterface) exitWith {};

0 spawn {

	waitUntil {time > 10}; // Let TFAR init properly
	if (player_is_jip) then {sleep 10;};
	_unit = [str(player),"_"] call BIS_fnc_splitstring;
    _i = parseNumber (_unit select 1);

	_CTS_Subgroup = parseNumber (_unit select 2);
	_CTS_Preset = [CTSfreqs select _i, []] select (_i < 0);

	if (_CTS_Subgroup == 0) then {
		CTS_TFAR_SW_freq = _CTS_Preset select 1;
		CTS_TFAR_LR_freq = _CTS_Preset select 0;
	} else {
		CTS_TFAR_SW_freq = (_CTS_Preset select 1) + _CTS_Subgroup;
		CTS_TFAR_LR_freq = _CTS_Preset select 1;
	};

	_CTS_TFAR_SW_radio = call TFAR_fnc_haveSWRadio;
	_CTS_TFAR_LR_radio = call TFAR_fnc_haveLRRadio;

	if (_CTS_TFAR_SW_radio) then {[(call TFAR_fnc_activeSwRadio), 1, str CTS_TFAR_SW_freq] call TFAR_fnc_SetChannelFrequency};
	if (_CTS_TFAR_LR_radio) then {[(call TFAR_fnc_activeLrRadio), 1, str CTS_TFAR_LR_freq] call TFAR_fnc_SetChannelFrequency};

	if (!_CTS_TFAR_LR_radio && _CTS_TFAR_SW_radio) then {
		systemChat format ["CTS: %1, tu frecuencia predeterminada de radio corta es: %2",name player,CTS_TFAR_SW_freq];
	};

	if (_CTS_TFAR_LR_radio && !_CTS_TFAR_SW_radio) then {
	systemChat format ["CTS: %1, tu frecuencia predeterminada de radio larga es: %2",name player,CTS_TFAR_LR_freq];
	};

	if (_CTS_TFAR_LR_radio && _CTS_TFAR_SW_radio) then {
	systemChat format ["CTS: %1, tus frecuencias de radio son: Corta: %2 | Larga: %3",name player,CTS_TFAR_SW_freq,CTS_TFAR_LR_freq];
	};

	if (!_CTS_TFAR_LR_radio && !_CTS_TFAR_SW_radio) then {
	systemChat format ["CTS: %1, No llevas radios. No se te ha asignado ninguna frecuencia.",name player];
	};

};

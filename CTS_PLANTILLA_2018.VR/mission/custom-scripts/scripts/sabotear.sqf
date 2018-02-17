_device = _this select 0;
_player = _this select 1;

if (local _player) then {
	[_device, _player] spawn {
		_startTime = time;
		_device = _this select 0;
		_player = _this select 1;

		hint "Saboteando. Mantente cerca del dispositivo.";
		waitUntil {
			(_device distance _player > 10 ||
			_startTime + 10 < time)
		};

		if (_device distance _player > 10) then {
			hint "Sabotaje interrumpido";
		} else {
			hint "Sabotaje completado";
			if (alive HVT_1) then {
				failDeviceTask = true;
				publicvariable "failDeviceTask";
			} else {endDeviceTask = true; publicVariable "endDeviceTask"};
		};
	};

};
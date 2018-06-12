private _tasks = _this;
private _i = 0;

{
    private _list = [];
   	for [{_i = 0}, {_i < count _tasks}, {_i = _i + 1}] do {
        private _current = _tasks select _i;		// [_filter, [_section, _subject, _text]]

        private _filter = _current select 0;
       	private _units = [_filter] call FHQ_fnc_ttiFilterUnits;

	    if (_x in _units) then {
        	//_list = _list + [_current select 1];
            _list pushBack (_current select 1);
        };
    };


    /* Now add them in reverse order */
    private _existing = _x getVariable ["FHQ_TTI_ClientTaskList", []];

   	for [{_i = 0}, {_i < count _list}, {_i = _i + 1}] do {
		private _current = _list select _i;
        _existing = [_current, _existing, _x] call FHQ_fnc_ttiCreateOrUpdateTask;
	}; 

    _x setVariable ["FHQ_TTI_ClientTaskList", _existing];
        
} foreach (if (isMultiplayer) then {playableUnits+FHQ_TTI_extraUnits} else {switchableUnits});
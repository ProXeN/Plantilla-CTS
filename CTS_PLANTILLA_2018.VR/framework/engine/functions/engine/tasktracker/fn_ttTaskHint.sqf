    /* Arma 3 */
    private ["_notifyTemplate", "_desc", "_state"];
        
    _desc = [_this, 0, ""] call BIS_fnc_param;
	_state = [_this, 1, "created"] call BIS_fnc_param;
	private _type = [_this, 2, ""] call BIS_fnc_param;
    _notifyTemplate = "TaskCreated";
        
    switch (tolower _state) do 
    {
		case "created":
        {
            _notifyTemplate = "TaskCreated";
        };
		case "assigned":
        {
            _notifyTemplate = "TaskAssigned";
        };
		case "succeeded":
        {
            _notifyTemplate = "TaskSucceeded";
        };
		case "canceled":
        {
            _notifyTemplate = "TaskCanceled";
        };
		case "cancelled":
        {
            _notifyTemplate = "TaskCanceled";
        };
		case "failed":
        {
            _notifyTemplate = "TaskFailed";
        };
        case "newbriefing":
        {
            _notifyTemplate = "TaskAssigned";
            if (isClass (missionConfigFile >> "CfgNotifications" >> "NewBriefing")) then {
               _notifyTemplate = "NewBriefing";
            };
        };
	};
        
	if (count _type != 0) then {
		_notifyTemplate = _notifyTemplate + "Icon";
		if (isClass (missionConfigFile >> "CfgTaskTypes" >> _type)) then {
			_type = getText (missionConfigFile >> "CfgTaskTypes" >> _type >> "icon");
		} else {
			_type = getText(configFile >> "CfgTaskTypes" >> _type >> "icon");
		};
		
	};
		
    [_notifyTemplate, [_type, _desc]] call BIS_fnc_showNotification;
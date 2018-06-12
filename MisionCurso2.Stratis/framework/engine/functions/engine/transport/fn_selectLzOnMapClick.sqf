params["_vehicle","_redZonePositions","_vehiclePositon","_baseLZPos","_radius","_minimumDistance","_markers","_baseRadius","_baseReturnAllowed","_isPickup"];
scopeName "onMapClickedHandler";

_resetMapState = {
	onMapSingleClick ""; // unregister click listener
	//delete markers
	{ deleteMarkerLocal _X; } forEach _markers;
};

if (_baseReturnAllowed && _pos distance2D _baseLZPos <= _baseRadius) then {
	// click on base area
	[_vehicle,"Recibido, RTB."] spawn BRM_transport_fnc_commsPilotToVehicle;
	[_vehicle] spawn BRM_transport_fnc_flyToBase;
	call _resetMapState;
} else {
	if (!_baseReturnAllowed && _pos distance2D _baseLZPos <= _baseRadius) then {
		hint "Por favor elige otra LZ. La que has seleccionado esta demasiado cerca de la base\n\nPara cancelar pulsa ESC.";
		breakOut "onMapClickedHandler"; // no need to check more
	};

	{
		if ((_x distance2D _pos) < _radius) then {
			hint "Por favor elige otra LZ. La que has seleccionado esta demasiado cerca del objetivo\n\nPara cancelar pulsa ESC.";
			breakOut "onMapClickedHandler"; // no need to check more
		};
	} forEach _redZonePositions;

	if !(_pos inArea "AO") then {
		hint "Por favor elige otra LZ. La que has seleccionado esta fuera del area de operaciones\n\nPara cancelar pulsa ESC.";
		breakOut "onMapClickedHandler"; // no need to check more
	};

	if (!(objNull isEqualTo _vehiclePositon) && (_vehiclePositon distance2D _pos < _minimumDistance)) then {
		hint "¿Eres imbecil? Ve andando, subnormal.";
		breakOut "onMapClickedHandler"; // no need to check more
	};

	/* Find a save landing Position */

	_safeLandingZonePosition = nil;
	_safeLandingZonePosition = [_pos , 0, 50, 20, 0, 0.3, 0,[],[[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;

	//if no zone found within 50 meters of selected pos, then search wider
	if (_safeLandingZonePosition select 0 == 0) then { // no safe zone found
		_safeLandingZonePosition = [_pos , 0, 200, 20, 0, 0.3, 0,[],[[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;
	};

	if (_safeLandingZonePosition select 0 == 0) then { // no safe zone found
		hint "Couldnt find a good LZ near your point, please select another.  Try to choose somewhere that is less built up";
	} else {
		call _resetMapState;
		[_safeLandingZonePosition, _vehicle, _isPickup] spawn BRM_transport_fnc_flyToLZ;
		//openMap false; //better leave it open ?
	};

};

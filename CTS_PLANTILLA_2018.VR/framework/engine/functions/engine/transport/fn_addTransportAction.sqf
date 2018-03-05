params ["_vehicle"];

_actionAdapter = {
	params ["_target", "_caller", "_ID", "_arguments"];
	[_target] spawn BRM_transport_fnc_selectLZ;
};

_actions = [
	[
		"Elegir LZ",
		_actionAdapter,
		nil,
		-20, //priority
		false,
		true,
		"",
		"_this in (crew _target) && !([_target] call BRM_transport_fnc_helicopterIsFlying)",
		-1,
		false,
		""
	],
	[
		"Desviar a otra LZ",
		_actionAdapter,
		nil,
		-20, //priority
		false,
		true,
		"",
		"_this in (crew _target) && ([_target] call BRM_transport_fnc_helicopterIsFlying)",
		-1,
		false,
		""
	]
];


_target = [0, -2] select isMultiplayer;
{
	if (isMultiplayer) then {
		if (isServer) then {
			[_vehicle, _x] remoteExec ["addAction",_target,true];
		};
	} else {
		_vehicle addAction _x;
	}
}	foreach _actions;

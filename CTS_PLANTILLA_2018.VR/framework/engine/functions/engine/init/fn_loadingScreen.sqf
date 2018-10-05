if ((!isMultiplayer)||(!hasInterface)) exitWith {};

0 spawn {
// Init
private ["_u", "_c"];

_u 	= player;
_t 	= (10 + (count mission_players * 3)) / 100;
_c	= 0;

titletext ["", "BLACK FADED",10e10];
[_u] call BRM_fnc_weaponAway;
_u enableSimulation false;
showMap false;

while {(_c != 100)} do {
	_c = _c + 1;

	private _msg = format ["
		<br/>
		<t align='left' size='1.1' color='#E6E6E6'>Iniciando Mision: </t>
		<t size='1.1' align='left' color='#F7D358' font='PuristaBold'>%1&#0037;</t><t size='1.1' align='left' color='#A1A4AD'></t><br/><br/>
		<t align='left' color='#9DA698'>- No te muevas</t><br/>
		<t align='left' color='#9DA698'>- No uses la radio</t><br/>
		<t align='left' color='#9DA698'>- Guarda silencio</t><br/>
		<t align='left' color='#9DA698'>- Espera unos %2 segs</t><br/><br/>
		<t align='left' color='#9DA698'>  Mision: </t><t color='#E6E6E6' align='left'>%3</t><br/>
	", _c, _t * 100, mission_version];

	sleep _t;
	hintSilent parseText _msg;
};

sleep 5;
_u enableSimulation true;
showMap true;

private _msg = format ["
	<br/>
	<t size='1.1' color='#FFFFFF' align='left'>Mision Cargada</t>
	<t size='1' align='left' color='#9DA698'><br/><br/>
	- No te muevas<br/>
	- No uses la radio<br/>
	- Guarda silencio<br/>
	- Espera unos %1 segs<br/><br/>
	  Mision: %2</t><br/><br/>
", _t * 100, mission_version];

hintSilent parseText _msg;
sleep 3; hintSilent "";
titletext ["", "PLAIN",0];
loading_screen_finished = true;
3 fadesound 1;
};

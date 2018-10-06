case "ESTABLISHING": {
    [player, toUpper(worldName)+", "+(_posPlayer call BIS_fnc_locationDescription), 1.5, 1, 280, 0] spawn BIS_fnc_establishingShot;
    0 spawn {
        sleep 15;
        enableSaving [false, false];
    };
};

case "TEXT": {
    [[
        [toUpper(worldName) + ", ","align='left' valign='bottom' font='PuristaBold'",""],
        [_posPlayer call BIS_fnc_locationDescription,"align='left'","#fff"]
    ]] spawn BIS_fnc_typeText2;
};

case "CINEMA": {
    _location = nearestLocation [ getPos player, "nameVillage"];
    _location = text _location;
    if (_location == "") then { _location = "Virtual Reality" };
    _minute = (date select 4); if ([str(_minute)] call CBA_fnc_strLen == 1) then { _minute = "0"+str(_minute) };

    _time = format ["%1:%2",(date select 3),_minute];

    [0,2,false,true] call BIS_fnc_cinemaBorder;

    [_location, _time] spawn BIS_fnc_infoText;

    sleep 3;
    [1,2,false,true] call BIS_fnc_cinemaBorder;

    enableSaving [false, false];
};

case "CTS": {
    CTS_MissionIntroImage = "\CTS_assets\orbat\CTS.paa";
    CTS_MissionDesc = getText (missionConfigFile >> "onLoadName");
    [CTS_MissionIntroImage, toUpper(CTS_MissionDesc)] spawn {
        _l = ["tLayer"] call BIS_fnc_rscLayer;
		_l cutText ["", "BLACK FADED", 100];
		_month = ["Unknowinus", "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio",
		  "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]
 		select (date select 1);
        playmusic "LeadTrack01a_F_EXP";
        sleep 1;
        ["<img size= '9' shadow='false' image='" + (_this select 0) + "'/><br/><br/><t size='.7' color='#FFFFFF'>PRESENTA</t>", 0, 0, 3, 6] spawn BIS_fnc_dynamicText;
        sleep 12;
        ["<t size='1.5' color='#FF8C00'>" + (_this select 1) + "</t>",0,0.45,4,7] spawn BIS_fnc_dynamicText;
        sleep 2;
		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [6];
		"dynamicBlur" ppEffectCommit 0;
		"dynamicBlur" ppEffectAdjust [0.0];
		"dynamicBlur" ppEffectCommit 10;
        _l cutText ["", "BLACK IN", 3];
		sleep 12;
		[
		 [
		  worldname
		 ],
		 [
		  (str(date select 2) + " de " + _month + " " + str(date select 0)),
		  1,
		  5
		 ],
		 [
		  "Equipo " + groupID(group player),
		  1,
		  1,
		  4
		 ]
		] spawn BIS_fnc_EXP_camp_SITREP;
    };
};

case "QUOTE": {
	enableEnvironment false;
	0 fadesound 0.2;
	cutText ["", "BLACK FADED", 999];
	playmusic "CTS";
	// time, [widht, height]
	_handle = [17] spawn BRM_Intros_fnc_fadeQuote;
	waitUntil {scriptDone _handle};
	enableEnvironment true;
    sleep 2;

	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [3];
	"dynamicBlur" ppEffectCommit 0;
	"dynamicBlur" ppEffectAdjust [0.0];
	"dynamicBlur" ppEffectCommit 5;
	cutText ["", "BLACK IN", 2];
	sleep 2;
	5 fadeSound 1;
	_location = nearestLocation [ getPos player, "nameVillage"];
    _location = text _location;
	if (_location == "") then { _location = "Virtual Reality" };
	_handle = [10,
		["<t color='#FF0000'>" + getText (missionConfigFile >> "onLoadName") + "</t>",
	    "Equipo Razor 1",
		"Tanoa, Horizon Islands",
	    "%1"],
		safeZoneY + safeZoneH*0.7, /* Optional, can also be array [x,y]  or empty*/
		["<t color='#E6E6E6'>", "</t>"] /* Optional, defaults to no prefix or suffix */
	] spawn  BRM_Intros_fnc_introDsp;

    waitUntil {scriptDone _handle};
	sleep 2;
	100012 cutfadeout 1;
};

case "APEX": {
    player enableSimulation false;
    _missionname = toUpper getText (missionConfigFile >> "onLoadName");
    _sound = [0,1,2] call BIS_fnc_selectRandom;
    _month = ["Unknowinus", "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]
    select (date select 1);
    ["Intro", false] call BRM_Intros_fnc_blackOut;
    // TIMELINE Y VIDEO PARA CAMPAÑAS
    //_video = ["\CTS_assets\videos\quote1.ogv"] call BRM_Intros_fnc_video;
    //waitUntil {scriptDone _video};
    //sleep 2;
    //_timeline = ["Mision_1"] spawn BRM_Intros_fnc_Timeline;
    //waitUntil {scriptDone _timeline};
    playmusic "CTS_Intro";
    sleep 1.2;
    _text = [[worldname], [(str(date select 2) + " de " + _month + " " + str(date select 0)), 1, 5], ["Equipo " + groupID(group player), 1, 1, 4]] spawn BIS_fnc_EXP_camp_SITREP;
    waitUntil {scriptDone _text};
    sleep 4;
    _present = ["<img size= '4' shadow='false' image='mission\images\group-logo.paa'/><br/><br/><t size='.7' color='#FFFFFF'>PRESENTA</t>",0,0.4,4.5,-1] spawn bis_fnc_dynamicText;
    enableSentences true;
    switch (_sound) do{
      case 0: {player globalRadio "Start1"; [[["HQ", "De acuerdo caballeros, solo tenemos una oportunidad. Adelante. Corto"]],"SIDE",0.10] spawn BRM_fnc_simpleConv;};
      case 1: {player globalRadio "Start2"; [[["HQ", "A todas las unidades. ¡Nos movemos!"]],"SIDE",0.10] spawn BRM_fnc_simpleConv;};
      case 2: {player globalRadio "Start3"; [[["HQ", "Procedan con la operación. Buena suerte. Corto."]],"SIDE",0.10] spawn BRM_fnc_simpleConv;};
    };
    waitUntil {scriptDone _present};
    enableSentences false;
    sleep 4.5;
    ["<t size='1.5' font='PuristaBold' color='#FFFFFF'>" + _missionName + "</t>",0,0.4,4,0] spawn BIS_fnc_dynamicText;
    player enableSimulation true;
    ["Intro", true] call BRM_Intros_fnc_blackIn;
};

case "TILES": {
  0 fadeSound 0;
  _l = ["tLayer"] call BIS_fnc_rscLayer;
  _l cutText ["", "BLACK FADED", 100];
  sleep 1.2;
  _unparsedText = "<t align='right' size='1.2'>";
  _missionName = getText (missionConfigFile >> "onLoadName");
  _month = ["Unknowinus", "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"] select (date select 1);
  [parsetext ("<t align='right'><t font='PuristaBold' size='1.6'>" + toUpper(_missionName) + "</t><br/>" + (str(date select 2) + " de " + _month + " " + str(date select 0)) + "<br/>Equipo " + groupID(group player)), true, nil, 8, 0.7, 0] spawn BIS_fnc_textTiles;

  if !(is3den) then {
  	for "_i" from 1 to 10 step 1 do {
  		[{
  			playsound "ReadoutClick";
  		}, [], (0.03 * _i)] call CBA_fnc_waitAndExecute;
  		[{
  			playsound "ReadoutClick";
  		}, [], (8.7 + (0.03 * _i))] call CBA_fnc_waitAndExecute;
  	};
  };

  0 fadeSound 1;
  sleep 8;
  "dynamicBlur" ppEffectEnable true;
  "dynamicBlur" ppEffectAdjust [6];
  "dynamicBlur" ppEffectCommit 0;
  "dynamicBlur" ppEffectAdjust [0.0];
  "dynamicBlur" ppEffectCommit 10;
  _l cutText ["", "BLACK IN", 3];
};

case "CAMERA": {
  _missionName = getText (missionConfigFile >> "onLoadName");
  _location = worldName;

  // Get date and time
  _month = str (date select 1);
  _day = str (date select 2);
  _hour = str (date select 3);
  _minute = str (date select 4);

  if (date select 1 < 10) then {_month = format ["0%1", str (date select 1)]};
  if (date select 2 < 10) then {_day = format ["0%1", str (date select 2)]};
  if (date select 3 < 10) then {_hour = format ["0%1", str (date select 3)]};
  if (date select 4 < 10) then {_minute = format ["0%1", str (date select 4)]};

  _date = format ["%1:%2 - %3-%4-%5", _hour, _minute,  _day, _month, str (date select 0)];

  _animationList = ["AmovPercMstpSrasWrflDnon_Salute", "c4coming2cdf_genericstani1", "c4coming2cdf_genericstani2", "c4coming2cdf_genericstani3", "c4coming2cdf_genericstani4"];

  // Create the effects
  _ppColor = ppEffectCreate ["colorCorrections", 1999];
  _ppColor ppEffectEnable true;
  _ppColor ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [0.8, 0.8, 0.8, 0.65], [1, 1, 1, 1.0]];
  _ppColor ppEffectCommit 0;

  _ppGrain = ppEffectCreate ["filmGrain", 2012];
  _ppGrain ppEffectEnable true;
  _ppGrain ppEffectAdjust [0.1, 1, 1, 0, 1];
  _ppGrain ppEffectCommit 0;

  // Black screen
  ["TF47_fnc_introShot",false] call BIS_fnc_blackOut;
  sleep 0.2;
  ["TF47_fnc_introShot",true] call BIS_fnc_blackIn;

  // Layers and interlacing.
  ("BIS_layerEstShot" call BIS_fnc_rscLayer) cutRsc ["RscEstablishingShot", "PLAIN"];

  ("BIS_layerStatic" call BIS_fnc_rscLayer) cutRsc ["RscStatic", "PLAIN"];
  ("BIS_layerInterlacing" call BIS_fnc_rscLayer) cutRsc ["RscInterlacing", "PLAIN"];
  ("BIS_fnc_blackOut" call BIS_fnc_rscLayer) cutText ["","PLAIN",10e10];

  // Create the camera
  _camera = "camera" camCreate (position player);
  _camera camSetTarget player;
  _camera camSetRelPos [0.0, 5.0, 1.5];
  _camera camSetFov 0.5;
  showCinemaBorder false;
  _camera cameraEffect ["internal", "back"];
  _camera camCommit 0;

  playMusic ("RadioAmbient" + str (1 + floor random 30));

  _selectedAnimation = selectRandom _animationList;

  player switchMove _selectedAnimation;

  [
      "<t color='#ff0000' shadow='2' size='0.8' font='PuristaBold'>" + _missionName  + "</t>" +
      "<t color='#d3d3d3' shadow='2' size='0.8' font='PuristaBold'>, " + _location + "</t><br/>" +
      "<t color='#e8e8e8' shadow='2' size='0.7' font='PuristaMedium'>" + _date + "</t><br/>",
      0, 0.83, 5, 3
  ] spawn BIS_fnc_dynamicText;

  sleep 6;

  player switchMove "AmovPercMstpSlowWrflDnon";
  playMusic "";
  // Remove colors effects and camera
  ppEffectDestroy _ppColor;
  ppEffectDestroy _ppGrain;
  _camera cameraEffect ["terminate", "back"];
  showCinemaBorder false;
  camDestroy _camera;

  // Reset layers
  "BIS_layerStatic" cutText ["", "PLAIN"];
  "BIS_layerEstShot" cutText ["", "PLAIN"];
  "BIS_layerInterlacing" cutText ["", "PLAIN"];

  // Fade into first person
  call BIS_fnc_VRFadeIn;
  playSound (selectRandom ["Transition1", "Transition2", "Transition3"]);

  "dynamicBlur" ppEffectEnable true;
  "dynamicBlur" ppEffectAdjust [1.5];
  "dynamicBlur" ppEffectCommit 0;
  "dynamicBlur" ppEffectAdjust [0.0];
  "dynamicBlur" ppEffectCommit 2;
};

case "DOOM": {
    player enableSimulation false;
    _missionname = toUpper getText (missionConfigFile >> "onLoadName");
    _sound = [0,1,2] call BIS_fnc_selectRandom;
    _month = ["Unknowinus", "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]
    select (date select 1);
    ["Intro", false] call BRM_Intros_fnc_blackOut;
    // TIMELINE Y VIDEO PARA CAMPAÑAS
    //_video = ["\CTS_assets\videos\quote_1.ogv"] call BRM_Intros_fnc_video;
    //waitUntil {scriptDone _video};
    //sleep 2;
    //_timeline = ["Mision_1"] spawn BRM_Intros_fnc_Timeline;
    //waitUntil {scriptDone _timeline};
    playmusic "CTS_Doom";
    sleep 4;
    _text = [[worldname], [(str(date select 2) + " de " + _month + " " + str(date select 0)), 1, 5], ["Equipo " + groupID(group player), 2, 2, 4]] spawn BIS_fnc_EXP_camp_SITREP;
    waitUntil {scriptDone _text};
    sleep 7.8;
    _present = ["<img size= '4' shadow='false' image='mission\images\group-logo.paa'/>",0,0.4,4,0] spawn bis_fnc_dynamicText;
    waitUntil {scriptDone _present};
    sleep 1.2;
    _present = ["<t size='1' color='#FFFFFF'>PRESENTA</t>",0,0.5,4,0] spawn bis_fnc_dynamicText;
    waitUntil {scriptDone _present};
    sleep 4.1;
    _present = ["<t size='1' color='#FFFFFF'>UNA MISIÓN POR " + toUpper(mission_author_name) + "</t>",0,0.5,4,0] spawn bis_fnc_dynamicText;
    waitUntil {scriptDone _present};
    player enableSimulation true;
    sleep 4.2;
    ["<t size='1.5' font='PuristaBold' color='#FFFFFF'>" + _missionName + "</t>",0,0.4,4,0] spawn BIS_fnc_dynamicText;
    ["Intro", true] call BRM_Intros_fnc_blackIn;
    "dynamicBlur" ppEffectEnable true;
    "dynamicBlur" ppEffectAdjust [1.5];
    "dynamicBlur" ppEffectCommit 0;
    "dynamicBlur" ppEffectAdjust [0.0];
    "dynamicBlur" ppEffectCommit 2;
};

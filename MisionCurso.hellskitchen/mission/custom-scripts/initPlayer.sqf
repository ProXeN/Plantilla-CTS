// ============================================================================
//                                                                             |
//              Este script solo lo ejecutan los jugadores.                    |
//                                                                             |
// ============================================================================

//Ejemplo de comunicaciones que se activa al llamar la función BRM_fnc_simpleConv desde un trigger.
//Primero estableceis las lineas de la conversación.
CTS_Conversacion = {
  if (player distance Contacto2 < 20) then {
    _line1 = ["Golf Oscar Delta", "Hola tio. ¿Qué te está pareciendo el tutorial?", Contacto2];
    _line2 = ["Golf Oscar Delta", "Está guapo ¿No?", Contacto2];
    _line3 = ["Golf Oscar Delta", "Si tienes alguna pregunta intenta no ponerte nerviosa y pregúntale a Proxen.", Contacto2];
    _line4 = ["Golf Oscar Delta", "Y bueno, eso es todo, pírate ya y sigue haciendo el tutorial o lo que sea.", Contacto2];
    _line5 = ["Golf Oscar Delta", "Buena suerte tio, y que Dios te bendiga.", Contacto2];
    [[_line1, _line2, _line3, _line4, _line5],"DIRECT",0.10] spawn BRM_fnc_simpleConv;
  };
};
// PARAMETROS LINEAS
// 0 - Indicativo del Emisor. (STRING)
// 1 - Mensaje (STRING)

// PARAMETROS FUNCION
// 0 - Líneas de conversación (ARRAY)
// 1 - Bando (STRING) "SIDE" / "GLOBAL" - Afecta al color del nombre del Emisor y al sonido de la radio.
// 2 - Multiplicador de espera (NUMBER) - Afecta al tiempo de espera entre líneas.
// 3 - Fondo (BOOL) - Muestra un fondo negro para facilitar lectura.

// =============================================================================
                                    sleep 1;

//  Todo lo que esté debajo de esta línea se ejecuta después del briefing.     |
// =============================================================================

if (!isNil "chopper1") then {
  _transportSelectAction = {
    [chopper1,true] spawn BRM_Transport_fnc_selectLZ;
  };

  if (isClass(configFile >> "CfgPatches" >> "ace_main")) then {
    myaction = ['CallTransportChopper','Pedir Helicoptero de Transporte','',_transportSelectAction,{true}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], myaction] call ace_interact_menu_fnc_addActionToObject;
  }
  else {
    _transportChopperActionID = player addAction ["Pedir Helicoptero de Transporte",_transportSelectAction];
    player setVariable ["callTransportChopperID", _transportChopperActionID];
  };
};

if (!isNil "chopper2") then {
  _transportSelectAction = {
    [chopper2,true] spawn BRM_Transport_fnc_selectLZ;
  };

  if (isClass(configFile >> "CfgPatches" >> "ace_main")) then {
    myaction = ['CallTransportChopper','Pedir Helicoptero de Transporte','',_transportSelectAction,{true}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], myaction] call ace_interact_menu_fnc_addActionToObject;
  }
  else {
    _transportChopperActionID = player addAction ["Pedir Helicoptero de Transporte",_transportSelectAction];
    player setVariable ["callTransportChopperID", _transportChopperActionID];
  };
};



// ============================================================================
//                                                                             |
//              Este script solo lo ejecutan los jugadores.                    |
//                                                                             |
// ============================================================================

//Ejemplo de comunicaciones que se activa al llamar la función BRM_fnc_simpleConv desde un trigger.
//Primero estableceis las lineas de la conversación.
CTS_Saludo = {
  if (player distance Contacto < 20) then {
    _line1 = ["Contacto", "¡Eh, aquí! Soy vuestro contacto. Bienvenidos a Guinea.", Contacto];
    _line2 = ["Contacto", "Dejémonos de rollos de espías y vamos al grano.", Contacto];
    _line3 = ["Contacto", "He tenido que esconder esa puta caja enorme vuestra de equipo, porque no puedo ir con eso por la calle.", Contacto];
    _line4 = ["Contacto", "Esto es una mierda ¿Es que no entienden nada los de arriba?", Contacto];
    _line5 = ["Contacto", "Bueno, esta es la ubicación, a partir de aquí es cosa vuestra.", Contacto];
    _line6 = ["Contacto", "Y tened cuidado, el avispero está revuelto, pero aún no sabemos por qué. Buena suerte.", Contacto];
    [[_line1, _line2, _line3, _line4, _line5, _line6],"SIDE",0.10] spawn BRM_fnc_simpleConv;
  };
};

// PARAMETROS
// 0 - Indicativo del Emisor. (STRING)
// 1 - Mensaje (STRING)

//USO
//En el editor colocad un trigger BLUFOR PRESENTE y en Activación poned:
// if (hasInterface) then {	[[line1, line2, line3, line4],"SIDE",0.15,false] spawn BRM_fnc_simpleConv; };

// PARAMETROS
// 0 - Líneas de conversación (ARRAY)
// 1 - Bando (STRING) "SIDE" / "GLOBAL" - Afecta al color del nombre del Emisor y al sonido de la radio.
// 2 - Multiplicador de espera (NUMBER) - Afecta al tiempo de espera entre líneas.
// 3 - Fondo (BOOL) - Muestra un fondo negro para facilitar lectura.

// ============================================================================

// =============================================================================
                                    sleep 1;

//  Todo lo que esté debajo de esta línea se ejecuta después del briefing.     |
// =============================================================================

//Ejemplo de conversaciones. Sentencias simples y conversaciones multirespuesta.
// Variables comunes
//IP_LiveFeed, controla si se usa el sistema de camara en vivo o se usa el avatar.
//IP_Buddy setVariable ["IP_LiveFeed", true];
//ambientlead setVariable ["IP_LiveFeed", true];
// IP_Avatar, controla la imagen de avatar que se usa. Por defecto se usa la de "framework\plugins\conversation_system\img\defaultAvatar.jpg"
//IP_Buddy setVariable ["IP_Avatar", "mission\images\buddyAvatar.jpg"];
// IP_ConvSpecial, algun tipo de subtexto a la hora de describir al personaje.
//IP_Buddy setVariable ["IP_ConvSpecial", "Best Buddy Ever"];

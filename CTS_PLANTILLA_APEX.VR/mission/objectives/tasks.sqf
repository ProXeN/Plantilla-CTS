
// ============================================================================
//                                                                             |
//         Usa este script para todo lo relacionado con tareas y objetivos     |
//               pero ten presente que solo lo ejecuta el servidor.            |
//                                                                             |
//         Se incluyen algunos ejemplos y documentación al final del script    |
//                                                                             |
// ============================================================================

if (!isServer) exitWith {};
[{scriptDone(mission_settings)}, {
CommsCompleted=false;
HackCompleted=false;
RescueCompleted=false;
// =============================================================================
[
side_a_side,
"TaskComms",
["Interceptar Comunicaciones", "Localizar y hackear terminal de comunicaciones del CSAT.", "radio", getPos intel],
["(true)","(CommsCompleted)"],
2,
["", "", ""]
] spawn BRM_fnc_newTask;

[
side_a_side,
"TaskRescue",
["Rescatar Rehen", "Rescatar al rehen.", "walk", getPos VIP],
["(true)","(RescueCompleted)","!(alive VIP)"],
2,
["", "", ""]
] spawn BRM_fnc_newTask;

[
side_a_side,
"TaskHack",
["Hackear Ordenador", "Hackea el portatil.", "download", []],
["(true)","(HackCompleted)"],
2,
["", "", ""]
] spawn BRM_fnc_newTask;

[
side_a_side,
"TaskRedfox",
["Eliminar a Redfox", "Mata a ese cabrón.", "kill", getPos Redfox],
["(true)","!(alive Redfox)"],
2,
["", "", ""]
] spawn BRM_fnc_newTask;

// =============================================================================
/*
[
// Bando al que se le asigna la tarea. side_a_side es el bando de los jugadores.
side_a_side,

// ID de la tarea.
"newTaskBLU1",

// Nombre de la tarea.
["Mata al oficial y protege al piloto.",

// Descripción.
"My description 1",

//Tipo de Tarea (Influye en el icono de la tarea. Consultar wiki de BIS para ver los tipos) https://community.bistudio.com/wiki/Arma_3_Tasks_Overhaul#Appendix
"kill",

//Localización de la tarea (dejar como array vacio [] si no se quiere indicar posición)
getPos oficial],

// Condiciones para: Tarea Asignada / Tarea Completada / Tarea Fallida (OPTIONAL)
["(true)","!(alive oficial)", "!(alive piloto)"],

// Prioridad de la tarea.
// 0 - Opcional (Se puede dejar sin hacer) | 1 - Secundaria (Debe completarse) | 2 - Principal (Debe completarse y si se falla se acaba la misión)
2,

// Código que se ejecuta cuando:
// Tarea Asignada | Tarea Completada | Tarea Fallida
["", "", ""]
] spawn BRM_fnc_newTask;
// =============================================================================

// =============================================================================
//  Ejemplo de Tarea Principal.
[
side_a_side,
"TaskHVT",
["Matar a Hitler", "Hitler ha estado haciendo cosas nazis. Mátalo.", "kill", []],
["(true)","!(alive Hitler)"],
2,
["", "", ""]
] spawn BRM_fnc_newTask;
*/
// =============================================================================

// =============================================================================
//  Recordad, las prioridades funcionan así:
//  0: Opcional. Se puede completar, fallar o dejar sin hacer.
//  1: Secundaria. Se debe completar para acabar la misión, pero no pasa nada si se falla.
//  2: Principal. Se debe completar para acabar la misión, y si se falla la misión finaliza al instante.
// =============================================================================

[] spawn BRM_fnc_checkTasks;

true
}, []] call CBA_fnc_waitUntilAndExecute;

/*
Nombre: BRM_conversation_system_fnc_addConversationMP
Autor: IndeedPete
Proposito:  Añade una conversación desde la config a la unidad u objeto que relaciona con la unidad con la unidad (e.g. un movil), i.e. añade la acción para iniciar la conversacion.
----------
Parametros:
_unit - OBJETO: Unidad a la que la acción deberia ser añadida, o a la que la conversacion hara referencia. - MyInterestingConversationPartner
_conversation - STRING: La entrada de conversacion que hace referencia a la conversacion deseada. Estas se pueden añadir en el fichero "mission/missionConversations.hpp" - "MyFirstConversation"
_object - OBJETO (OPCIONAL): La accion sera añadida al objeto seleccionado en vez de a la unidad. - MyCellphone - DEFAULT: objNull
*/
if !(isServer) exitWith {};

private ["_unit", "_conversation", "_object"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_conversation = [_this, 1, "", [""]] call BIS_fnc_param;
_object = [_this, 2, objNull, [objNull]] call BIS_fnc_param;

[_unit, _conversation, _object] remoteExec ["BRM_conversation_system_fnc_addConversationLocal", 0, true];

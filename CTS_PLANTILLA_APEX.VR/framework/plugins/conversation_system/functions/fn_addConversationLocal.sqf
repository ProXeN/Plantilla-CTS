/*
Nombre: BRM_conversation_system_fnc_addConversationLocal
Autor: IndeedPete
Proposito:  Añade una conversación desde la config a la unidad u objeto que relaciona con la unidad con la unidad (e.g. un movil), i.e. añade la acción para iniciar la conversacion.
----------
Parametros:
_unit - OBJETO: Unidad a la que la acción deberia ser añadida, o a la que la conversacion hara referencia. - MyInterestingConversationPartner
_conversation - STRING: La entrada de conversacion que hace referencia a la conversacion deseada. Estas se pueden añadir en el fichero "mission/missionConversations.hpp" - "MyFirstConversation"
_object - OBJETO (OPCIONAL): La accion sera añadida al objeto seleccionado en vez de a la unidad. - MyCellphone - DEFAULT: objNull
*/
if !(hasInterface) exitWith {};

private ["_unit", "_conversation", "_object", "_addTo", "_var", "_condition", "_sentences", "_arguments", "_firstSentence", "_id"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_conversation = [_this, 1, "", [""]] call BIS_fnc_param;
_object = [_this, 2, objNull, [objNull]] call BIS_fnc_param;

_addTo = if (!(isNull _object)) then {
	_var = "IP_CONV_OBJ_" + _conversation;
	_unit setVariable [_var, _object];
	_object
} else {_unit};

_var = "IP_CONV_" + _conversation;
if ((_addTo getVariable [_var, -1]) >= 0) exitWith {};
_condition = (missionConfigFile >> "Conversations" >> _conversation >> "condition");

_condition = if ((!isText _condition) OR ((getText _condition) == "")) then {"true"} else {(getText _condition)};
_sentences = getArray(missionConfigFile >> "Conversations" >> _conversation >> "sentences");
if (count _sentences == 0) exitWith {[("Conversation " + str(_conversation) + " has no sentences!")] call BIS_fnc_error};

_arguments = (missionConfigFile >> "Conversations" >> _conversation >> "arguments");
if ((isArray _arguments) && {count(getArray _arguments) > 0}) then {
	_arguments = getArray _arguments;
	for "_i" from 0 to ((count _arguments) - 1) do {
		_arguments set [_i, (call compile (_arguments select _i))];
	};
} else {
	_arguments = [];
};

_firstSentence = _sentences select 0;
_firstSentence = "'" + (format ([_firstSentence] + _arguments)) + "'";
_id = _addTo addAction [_firstSentence, {nul = [(_this select 1), (_this select 3 select 0), (_this select 3 select 1)] spawn BRM_conversation_system_fnc_openConversation}, [_unit, _conversation], 1.5, false, true, "", ("(_this distance _target < 3) && (alive _target) && " + _condition)];
_addTo setVariable [_var, _id];

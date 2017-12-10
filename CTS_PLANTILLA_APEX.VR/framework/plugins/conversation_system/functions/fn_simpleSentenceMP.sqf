/*
Name: BRM_conversation_system_fnc_simpleSentenceMP
Author: Zriel
Purpose: Proposito: Simula una sentencia directa o por radio. Calcula el delay automaticamente basado en la longitud de entrada. Activada solo en servidor y replicada a todos los clientes.
----------
Parametros:
_speaker - OBJECT: Unidad que dira la _sentence. - player
_sentence - STRING: Texto que el _speaker dira. - "Hello world!"
_wichChat - STRING (OPCIONAL): Que tipo de comunicacion de Arma se usara. Disponibles: "SIDE", "GROUP", "VEHICLE", "CUT" or "DIRECT" - "DIRECT" - DEFECTO: "SIDE"
_add - NUMBER (OPCIONAL): Adición en segundos al delay calculado automaticamente. Puede ser negativo. - 5 - DEFAULT: 0
_len - NUMBER (OPCIONAL): Delay fijo. - 20 - DEFECTO: ((count (toArray _sentence)) * _x) <- Calculo para determinar el delay
----------
Requires:
Dialog "IP_DLG_SIMPLESENTENCE"
.jpg - "framework\plugins\conversation_system\img\defaultAvatar.jpg"
*/

if (!isServer) exitWith {};
private ["_x","_speaker", "_sentence", "_wichChat", "_add", "_len"];
_x = 0.09;

_speaker = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_sentence = [_this, 1, "", [""]] call BIS_fnc_param;
_wichChat = toUpper([_this, 2, "SIDE", [""]] call BIS_fnc_param);
_add = [_this, 3, 0, [0]] call BIS_fnc_param;
_len = [_this, 4, ((count(toArray _sentence)) * _x), [0]] call BIS_fnc_param;

[_speaker, _sentence, _wichChat, _add, _len] remoteExec ["BRM_conversation_system_fnc_simpleSentenceLocal", 0];

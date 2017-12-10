/*
Name: BRM_conversation_system_fnc_simpleConversationMP
Author: Zriel
Purpose: Wrapper function to create a simple conversation from several simple sentences (BRM_conversation_system_fnc_simpleSentence).
----------
Parametros:
_speakers - ARRAY DE OBJETOS: Unidades que alternativamente dicen las _sentences. - [player, SomeGuy]
_sentences - ARRAY OF STRINGS: Frase que los _speakers diran. Cada Xth frase sera dicha por el hablante Xth. - ["Hello world!", "Fuck off!"]
_wichChat - STRING (OPCIONAL): Que tipo de comunicacion de Arma se usara. Disponibles: "SIDE", "GROUP", "VEHICLE", "CUT" or "DIRECT" - "DIRECT" - DEFECTO: "SIDE"
_isCutscene - BOOL (OPCIONAL): Modo cinematico: En true, se mostraran unos bordes de pantalla y la conversación se podra saltar con el "espacio". - true - DEFECTO: false
----------
Requires:
BRM_conversation_system_fnc_simpleConversationLocal
*/
if (!isServer) exitWith {};

if (count _this < 2) exitWith {false};

private ["_speakers", "_sentences", "_whichChat", "_isCutscene", "_count", "_ehSkip"];
_speakers = [_this, 0, [], [[]]] call BIS_fnc_param;
_sentences = [_this, 1, [], [[]]] call BIS_fnc_param;
_whichChat = [_this, 2, "SIDE", [""]] call BIS_fnc_param;
_isCutscene = [_this, 3, false, [true]] call BIS_fnc_param;

[_speakers, _sentences, _wichChat, _isCutscene] remoteExec ["BRM_conversation_system_fnc_simpleConversationLocal", 0];


// ============================================================================
//                                                                             |
//       Edit this file with the relevant information about your mission.      |
//                                                                             |
// ============================================================================

class Header {

// Mission type. ===============================================================

// https://community.bistudio.com/wiki/Multiplayer_Game_Types
gameType = coop;

// You can ignore these.
minPlayers = 2;
maxPlayers = 50;
};
// Mission and Author's name, loading description and loading picture. =========

briefingName = "Operacion Punset";
onLoadName = "Operacion Punset";
author = "Proxen";
overviewPicture = "\cts_assets\overview\overview2.paa"; //1 Boosque, 2 Nocturno, 3 Tanoa, 4 Mediterraneo
overviewText = "Hackear portátil y recuperar documentos en Stratis.";
onLoadMission = "Operacion Punset";
loadScreen = "mission\images\loading-screen.jpg";

// Disables certain radio channels in the mission. =============================

disableChannels[]={0,2};

/* 0 = Global
   1 = Side
   2 = Command
   3 = Group
   4 = Vehicle
   5 = Direct
   6 = System */

// I don't recommend messing with these. =======================================

respawn = 3;
respawnDialog = 0;
respawnTemplates[] = {"Base"};
respawndelay = 5;
disabledAI = 1;
enableDebugConsole = 1;
saving = 0;

// =============================================================================

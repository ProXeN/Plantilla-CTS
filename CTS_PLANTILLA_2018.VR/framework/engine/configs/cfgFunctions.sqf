
// ============================================================================
//                                                                             |
//     Initializes all main Framework functions, including inits and API.      |
//                                                                             |
// ============================================================================

class BRM {
    class init {
        file = "framework\engine\functions\engine\init";
        class doLog{};
        class loadSettings{preInit = 1;};
        class initVariables{preInit = 1;};
        class assignSideProperties {};
        class engine_pre{preInit = 1;};
        class orbat{postInit = 1;};
        class mapCover{postInit = 1;};
        class loadingScreen{postInit = 1;};
        class logPlugins{postInit = 1;};
    };
    class unit {
        file = "framework\engine\functions\engine\unit";
        class removeJIP{};
        class setAlias{};
        class setGrpIDGlobal;
        class defineGroups{postInit = 1;};
        class JIP{postInit = 1;};
    };
    class misc {
        file = "framework\engine\functions\engine\misc";
		    class animation{};
        class getSpawnPoint{};
        class syncTime{};
        class getSideInfo{};
    		class spawnGunners{};
        class simpleConv{};
    		class messageLog{};
    		class createInsertion{};
    		class createExtraction{};
        class RRR{};
        class objectMarker{};
        class lightPoint{};
    };
    class ending {
        file = "framework\engine\functions\engine\ending";
        class callEnding{};
    };
    class events {
        file = "framework\engine\events";
        class initPlayer{postInit = 1;};
        class onPlayerKilled{};
        class onPlayerRespawn{};
        class initAI{};
        class onAIKilled{};
    };
    class briefing {
        file = "mission\briefings";
        class loadBriefing{postInit = 1;};
    };
    class api {
        file = "framework\engine\functions\api";
        class newMarkerArea{};
        class newMarkerIcon{};
        class stripItems{};
        class weaponAway{};
        class garrisonUnits{};
        class occupy{};
        class showText{};
        class colorToHex{};
        class verboseArray{};
        class addIfNew{};
        class unitFromName{};
        class callCodeArea{};
        class setGear{};
        class getGear{};
        class playGlobal{};
        class getUnitsArray{};
        class getRoadPosition{};
        class getFactionVehicles{};
		    class weatherEffects{};
    };
    class loadouts_functions {
    	file = "mission\loadouts\functions";
    	class addAmmo {};
    	class addAmmoAuto {};
    	class getAmmoClass {};
    	class addEmptyBackpack {};
    	class setVehiclesArray{};
    	class addItem {};
    	class addMedicBasics {};
    	class addOptics {};
    	class addRadio {};
    	class addRadioToCargo {};
    	class addToBackpack {};
    	class addToCargo {};
    	class addToUniform {};
    	class addToVest {};
    	class addWeapon {};
    	class addWeaponKit {};
    	class attachToWeapon {};
    	class linkItem {};
    	class stripUnit {};
    	class useUniform {};
    	class setUnitIdentity {};
    	class getSideUAV {};
    	class addWeaponAttachments{};
    };
    class loadout {
        file = "mission\loadouts";
        class assignLoadout{};
        class assignCargo{};
        class getLoadoutProperty {};
    };
};

#include "..\functions\engine\tasktracker\Functions.cpp"

class BRM_Intros {
  class Functions {
    file = "framework\engine\functions\engine\intros";
    class typeWriter {};
    class fadeQuote {};
    class introDsp {};
    class blackIn{};
    class blackOut{};
    class timeline{};
    class video{};
    class postInit{postInit=1;};
  };
};

class BRM_f_remove_body
{
	class Functions {
		file = "framework\engine\functions\engine\f_remove_body";
		class removeBody {};
		class nearPlayer {};
    class postinit {postInit = 1;};
	};
};

class BRM_transport
{
  class Functions {
    file = "framework\engine\functions\engine\transport";
    class addTransportAction{};
    class selectLZ{};
    class selectLZCreateBolckedAreaMarker{};
    class selectLZOnMapClick{};
    class helicopterIsFlying{};
    class commsPilotToVehicle{};
    class commsHQ{};
    class commsSide{};
    class flyToBase{};
    class flyToLZ{};
    class checkMissionIdActive{};
    class isOnlyBoardCrewOnBoard{};
  };
};

class BRM_HC
{
	class Functions {
		file = "framework\engine\functions\engine\headless_client";
		class postinit {postInit = 1;};
	};
};

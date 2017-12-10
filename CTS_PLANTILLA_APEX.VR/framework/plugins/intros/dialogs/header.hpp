// Control types
#define CT_STATIC	0
#define CT_STRUCTURED_TEXT 13

// Static styles
#define ST_LEFT	0
#define ST_RIGHT	1
#define ST_CENTER	2
#define ST_UP		3
#define ST_DOWN	4
#define ST_VCENTER	5

#define ST_SINGLE	0
#define ST_MULTI	16
#define ST_PICTURE	48
#define ST_FRAME	64

#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE 144
#define ST_WITH_RECT 160
#define ST_LINE	176

#define ST_SHADOW	256
#define ST_NO_RECT	512

#define FontM "PuristaSemiBold"
#define ST_LEFT      0
#define ST_RIGHT     1
#define ST_CENTER    2
#define CT_STATIC    0

class RscPicture
{
	idc = -1;
	type = CT_STATIC;
	style = ST_CENTER + ST_PICTURE;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "PuristaSemiBold";
	sizeEx = 0.02;
};

class FHQ_Quote : RscPicture {
	
	text = "mission\images\quote.jpg";
	x = -10;
	y = -10;
	w = 1;
	h = 1;
};

class RscText
{
	type = 0;
	idc = -1;
	style = 0;
	shadow = 2;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "PuristaMedium";
	sizeEx = 0.02;
	text = "";
	x = 0;
	y = 0;
	w = 0;
	h = 0;
	fixedWidth = 0;
};

class RscStructuredText
{
	style = 0;
	type = CT_STRUCTURED_TEXT;
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = (safezoneH / 4) / 5;
	sizeEx = 0.02;
	colorText[] = {1,1,1,1.0};
	shadow = 1;
	class Attributes
	{
		font = "PuristaMedium";
		color = "#ffffff";
		align = "left";
		shadow = 1;
		size = "1";
	};
};

class RscIntroDialog {
	onload = "uinamespace setvariable ['fhq_RscIntroDialog',_this select 0];";
	idd = 888;
	movingEnable = false;
	moving = false;
	duration=10e10;
	enableSimulation = true;
	x = safeZoneX;
	y = safeZoneY;
	w = safeZoneW;
	h = safeZoneH;

	class ControlsBackground {
		/*class Gradient : RscPicture {
			idc = 1200;
			text = "images\gradient_ca.paa";
			x = safezoneX;
			y = 3*((safeZoneY + safeZoneH)/4);
			w = 3 * safezoneW / 4 ;
			h = safezoneH / 4;
		};
		class FHQLogo : RscPicture {
				idc = 1210;
				text = "images\logo_ca.paa";
				x = 0.788375 * safezoneW + safezoneX;
				y = 0.731306 * safezoneH + safezoneY;
				w = 0.199465 * safezoneW;
				h = 0.32161 * safezoneH;	
		};*/
	};
	class Controls {
		class missionTitle : RscStructuredText {
			idc = 1201;
			text = "";
			style = ST_LEFT;
			x = safeZoneX;
			y = safezoneY;
			w = safeZoneW;
			h = 2 * (safezoneH / 4) / 5;
			sizeEx = 2 * (safezoneH / 4) / 5;
		};
		class missionLine1 : RscStructuredText {
			idc = 1202;
			text = "";
			style = ST_LEFT;
			x = safeZoneX;
			y = safezoneY;
			w = safeZoneW;
			h = 1 * (safezoneH / 4) / 5;
			sizeEx = (safezoneH / 4) / 5;
		};
		class missionLine2 : missionLine1 {
			idc = 1203;
		};
		class missionLine3 : missionLine1 {
			idc = 1204;
		};
	};
};


class RscQuoteDialog {
	onload = "uinamespace setvariable ['fhq_RscQuoteDialog',_this select 0];";
	idd = 889;
	movingEnable = false;
	moving = false;
	duration=10e10;
	enableSimulation = true;
	x = safeZoneX;
	y = safeZoneY;
	w = safeZoneW;
	h = safeZoneH;

	class Controls {
		class FHQ_QuoteInstance : FHQ_Quote {
			idc = 1201;
		};
	};
};

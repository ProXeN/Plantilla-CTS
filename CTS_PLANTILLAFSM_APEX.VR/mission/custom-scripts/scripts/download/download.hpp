// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_HITZONES         17
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102
#define CT_ITEMSLOT         103
#define CT_CHECKBOX         77

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0
#define ST_UPPERCASE      0xC0
#define ST_LOWERCASE      0xD0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// progress bar
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4
#define MB_ERROR_DIALOG   8

// Xbox buttons
#define KEY_XINPUT                0x00050000
#define KEY_XBOX_A                KEY_XINPUT + 0
#define KEY_XBOX_B                KEY_XINPUT + 1
#define KEY_XBOX_X                KEY_XINPUT + 2
#define KEY_XBOX_Y                KEY_XINPUT + 3
#define KEY_XBOX_Up               KEY_XINPUT + 4
#define KEY_XBOX_Down             KEY_XINPUT + 5
#define KEY_XBOX_Left             KEY_XINPUT + 6
#define KEY_XBOX_Right            KEY_XINPUT + 7
#define KEY_XBOX_Start            KEY_XINPUT + 8
#define KEY_XBOX_Back             KEY_XINPUT + 9
#define KEY_XBOX_LeftBumper       KEY_XINPUT + 10
#define KEY_XBOX_RightBumper      KEY_XINPUT + 11
#define KEY_XBOX_LeftTrigger      KEY_XINPUT + 12
#define KEY_XBOX_RightTrigger     KEY_XINPUT + 13
#define KEY_XBOX_LeftThumb        KEY_XINPUT + 14
#define KEY_XBOX_RightThumb       KEY_XINPUT + 15
#define KEY_XBOX_LeftThumbXRight  KEY_XINPUT + 16
#define KEY_XBOX_LeftThumbYUp     KEY_XINPUT + 17
#define KEY_XBOX_RightThumbXRight KEY_XINPUT + 18
#define KEY_XBOX_RightThumbYUp    KEY_XINPUT + 19
#define KEY_XBOX_LeftThumbXLeft   KEY_XINPUT + 20
#define KEY_XBOX_LeftThumbYDown   KEY_XINPUT + 21
#define KEY_XBOX_RightThumbXLeft  KEY_XINPUT + 22
#define KEY_XBOX_RightThumbYDown  KEY_XINPUT + 23

// Fonts
#define GUI_FONT_NORMAL			PuristaMedium
#define GUI_FONT_BOLD			PuristaSemibold
#define GUI_FONT_THIN			PuristaLight
#define GUI_FONT_MONO			EtelkaMonospacePro
#define GUI_FONT_NARROW			EtelkaNarrowMediumPro
#define GUI_FONT_CODE			LucidaConsoleB
#define GUI_FONT_SYSTEM			TahomaB

// Grids
#define GUI_GRID_CENTER_WAbs	((safezoneW / safezoneH) min 1.2)
#define GUI_GRID_CENTER_HAbs	(GUI_GRID_CENTER_WAbs / 1.2)
#define GUI_GRID_CENTER_W		(GUI_GRID_CENTER_WAbs / 40)
#define GUI_GRID_CENTER_H		(GUI_GRID_CENTER_HAbs / 25)
#define GUI_GRID_CENTER_X		(safezoneX + (safezoneW - GUI_GRID_CENTER_WAbs)/2)
#define GUI_GRID_CENTER_Y		(safezoneY + (safezoneH - GUI_GRID_CENTER_HAbs)/2)

class ProgressBaseTextHUD
{
	access = 0;
	type = CT_STATIC;
	style = ST_LEFT;
	idc = ST_LEFT;
	x = 1 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
	y = 1 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
	w = 10 * GUI_GRID_CENTER_W;
	h = 2 * GUI_GRID_CENTER_H;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,0.8};
	text = "";
	fixedWidth = 0;
	shadow = 2;
	font = "puristaMedium";
	sizeEx = "0.035";
};
class RscProgressBar
{
	type = CT_PROGRESS;
	style = ST_VCENTER;
	x = 0.344;
	y = 0.619;
	w = 0.313726;
	h = 0.0261438;
	texture = "";
	shadow = 2;
	colorFrame[] = {0, 0, 0, 1};
	colorBackground[] = {0,0,0,0.7};
	colorBar[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
};
class MyProgressBar
{
	name = "MyProgressBar";
	idd = 37200;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['PBarProgress',_this select 0];";
	class Controls
	{
		class background: ProgressBaseTextHUD
		{
			idc = 37201;

			x = safeZoneX + safeZoneW / 1.5 - GUI_GRID_CENTER_W * 10;
			y = safeZoneY + safeZoneH - 4.5*GUI_GRID_CENTER_H; //0.5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y; //safeZoneY + 40 * pixelh;
			w = 0.65 + pixelw * 128; h = pixelh * 65;
			colorBackground[] = {0,0,0,0.7};
		};
		class Progress: RscProgressBar
		{
			idc = 37202;

			x = safeZoneX + safeZoneW / 1.5 - GUI_GRID_CENTER_W * 10 + pixelw * 128;
			y = safeZoneY + safeZoneH - 4.5*GUI_GRID_CENTER_H + pixelh * 1; //0.5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y; //safeZoneY + 40 * pixelh;
			w = 0.65; h = pixelh * 64;
		};
		class ProgressText: ProgressBaseTextHUD
		{
			idc = 37203;

			text = "";
			x = safeZoneX + safeZoneW / 1.5 + GUI_GRID_CENTER_W * 3;
			y = safeZoneY + safeZoneH - 4.7*GUI_GRID_CENTER_H; //3 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 0.65;
			h = pixelh * 65;
		};
		class ProgressSignal: ProgressBaseTextHUD
		{
			idc = 37204;
			style = ST_PICTURE + ST_LEFT;

			text = "\A3\ui_f\data\IGUI\RscTitles\RscHvtPhase\jac_a3_signal_4_ca.paa";
			x = safeZoneX + safeZoneW / 1.5 - GUI_GRID_CENTER_W * 10;
			y = safeZoneY + safeZoneH - 4.5*GUI_GRID_CENTER_H; //3 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = pixelw * 128;
			h = pixelh * 64;
		};
	};
};

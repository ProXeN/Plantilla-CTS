/*
	POLPOX's Calm Animations 3.03 (PLP_calmSoldier3)


	Author: POLPOX

	Description:
	Adds calm animation for some units which they cancel when under fire.

	Parameter(s):
		0: OBJECT - unit
		1: STRING or ARRAY - mode (Marked with [*] means available smoothly in)
		>"STAND" - Standing, with rifle
		>"STAND_U" - Standing
		>"GUARD" - Standing, hands on back
		>"WATCH" - Standing, patrolling with rifle
		>"LEAN" - Standing, lean on wall with rifle
		>"LEAN_ON_TABLE" - Standing, hands on table
		>"LISTEN_BRIEFING" - Standing, listening
		>"BRIEFING" - Briefing
		>"BRIEFING_POINT_RIGHT" - Briefing, sometime point right
		>"BRIEFING_POINT_LEFT" - Briefing, sometime point left
		>"BRIEFING_POINT_TABLE" - Briefing, sometime point table
		>"TALKING" - Standing, hands move
		>"KNEEL" - Kneeling, with rifle
		>"KNEEL_U" - Kneeling
		>"EXERCICE" - Pushup and squat

		>"WARMUP" - Warm up, with rifle
		>"WARMUP_KNEEL" - Warm up, kneeling, with rifle
		>"WARMUP_P" - Warm up, with pistol
		>"WARMUP_KNEEL_P" - Warm up, kneeling, with pistol
		>"WARMUP_U" - Warm up
		>"WARMUP_KNEEL_U" - Warm up, kneeling

		>"SIT" - On chair, with rifle
		>"SIT_U" - On chair
		>"SIT_LOW" - On flatground, with rifle, available smootly in
		>"SIT_LOW_U" - On flatground, available smootly in
		>"SIT_SAD" - On ground, looks sad
		>"SIT_LOW_SAD" - On flatground, looks sad
		>"SIT_HIGH1" - On high ground#1
		>"SIT_HIGH2" - On high ground#2, available smootly in
		>"SIT_AT_TABLE" - On chair, hands on table

		>"REPAIR_VEH_PRONE" - Proning repair
		>"REPAIR_VEH_KNEEL" - Kneeling repair
		>"REPAIR_VEH_STAND" - Standing repair

		>"CUFFED" - On ground, hands back, can't react

		>"KNEEL_TREAT1" or "KNEEL_TREAT" - Treating wounds#1, available smootly in
		>"KNEEL_TREAT2" - Treating wounds#2, available smootly in
		>"PRONE_INJURED" - Wounding, with rifle and don't react
		>"PRONE_INJURED_U1" - Wounding#1
		>"PRONE_INJURED_U2" - Wounding#2
		>"PRONE_INJURED_AGONY" - Wounding, agony (note this is bit glitchy)
		>"DEAD" - Dead state, on flatground
		>"DEAD_AT_WALL" - Dead state, at wall
		>Additional arguments on 1:
			>0: STRING - animation name
			>1: NUMBER - animation number
		2: BOOL - smoothly in (If the animation can deal the unit will transition)
		3: STRING or NUMBER - (optional) gear option
			>"LIGHT" or 1 - no vest, no helmet
			>"MEDIUM" or 2 - no helmet
			>"FULL" or 3 - fully loaded
			>"ASIS" or 4 - no change
			>"RANDOM" or -1 - (default) randomize
		4: STRING - (optional) additional condition
		5: BOOL - (optional) debug mode (If enable the script will output the state on chat)
		6: OBJECT - (optional) object to attach (This arugment will overwrite the synchronize)

	Returns:
	None

	Note:
	You can edit the script, e.g. remove the readme, change animation datas etc.
	Also you can re-upload the script.
*/

//
//	EARLY INIT
//
if (isMultiplayer && hasInterface) exitWith {};

_origPos = getPosASL param [0] ;
_origDir = getDir param [0] ;
param [0] enableSimulationGlobal false ;

waitUntil {time != 0} ;
//
//	INITIALIZATION VALUES
//
params [
	["_unit",objNull,[objNull]],
	["_anim","STAND",["",[]]],
	["_smoothIn",true,[true]],
	["_loadOption",-1,["",0]],
	["_cond","false",[""]],
	["_debug",false,[false]],
	["_attachObj",objNull,[objNull]]
] ;
_fnc_scriptName = "PLP_calmSoldier_3" ;
#define CHATLOG(ANY)	if (_debug) then {systemChat str ANY} ;

private ["_data","_anim","_index","_loadOption"] ;
if (typeName _anim == "ARRAY") then {
	_anim = param [1] select 0 ;
	_index = param [1] select 1 ;
} ;
_anim = toUpper _anim ;

/*
	0: Load Option
	1: Weapon (false to remove rifle)
	2: Pos-Dir Coef
	3: Custom Condition (Overwrite the default condition)
	4: In and out moves
	5: Ignore out moves when the unit is killed
	6: Custom Codes (Run at begin the execution)
	7: Ignore all executions for unreactable animation
	8: Custom Codes (Run at after the execution)
*/

//	-----------------------------------
//	BRING ANIMATION DATAS
//	-----------------------------------
#define GETVALUE(ANIM,SEL)	((ANIM call BIS_fnc_ambientAnimGetParams) param [SEL])
#define commonNon	"amovpercmstpsnonwnondnon"
#define commonRfl	"amovpercmstpslowwrfldnon"

_data = call {
	//
	//	STAND
	//
	if (_anim isEqualTo "STAND") exitWith {
		[
			[
				[
					GETVALUE("STAND",0)
				],
				[
					(GETVALUE("STAND2",0) - [commonRfl])
				]
			],
			[0,[1,2]],
			[4,["",commonRfl]]
		]
	} ;
	if (_anim isEqualTo "STAND_U") exitWith {
		#define STNDSTR(NUM)	"AidlPercMstpSnonWnonDnon_G0"+str NUM
		[
			[
				[
					GETVALUE("STAND_U1",0)
				],
				[
					GETVALUE("STAND_U2",0)
				],
				[
					GETVALUE("STAND_U3",0)
				],
				[
					["Acts_CivilIdle_1"]
				],
				[
					["Acts_CivilIdle_2"]
				],
				[
					[
						STNDSTR(1),
						STNDSTR(2),
						STNDSTR(3),
						STNDSTR(4),
						STNDSTR(5),
						STNDSTR(6)
					]
				]
			],
			[0,[1,2]],
			[1,false],
			[4,["","AmovPercMstpSnonWnonDnon"]]
		]
	} ;
	if (_anim isEqualTo "GUARD") exitWith {
		[
			[
				[
					GETVALUE("GUARD",0)
				]
			],
			[0,[3,2,2]],
			[1,false],
			[4,["","AmovPercMstpSlowWnonDnon"]]
		]
	} ;
	if (_anim isEqualTo "WATCH") exitWith {
		[
			[
				[
					GETVALUE("WATCH1",0)
				],
				[
					GETVALUE("WATCH2",0)
				]
			],
			[0,[3,2]],
			[4,["",commonRfl]]
		]
	} ;
	if (_anim isEqualTo "LEAN") exitWith {
		[
			[
				[
					GETVALUE(_anim,0)
				]
			],
			[0,[3,2]],
			[2,[[0,0,0],-45]],
			[4,["",commonRfl]]
		]
	} ;
	if (_anim isEqualTo "LEAN_ON_TABLE") exitWith {
		[
			[
				[
					GETVALUE(_anim,0)
				]
			],
			[0,[2,2,1]],
			[1,false],
			[4,["",commonRfl]]
		]
	} ;
	if (_anim isEqualTo "LISTEN_BRIEFING") exitWith {
		[
			[
				[
					GETVALUE("LISTEN_BRIEFING",0)
				]
			],
			[0,[3,2]],
			[1,false],
			[4,["",commonRfl]]
		]
	} ;
	if (_anim isEqualTo "TALKING") exitWith {
		[
			[
				[
					["acts_StandingSpeakingUnarmed"]
				],
				[
					["acts_PointingLeftUnarmed"]
				],
				[
					["Acts_CivilTalking_1"]
				],
				[
					["Acts_CivilTalking_2"]
				]
			],
			[0,[1,2]],
			[1,false],
			[4,["",commonNon]]
		]
	} ;
	if (
		_anim isEqualTo "BRIEFING_POINT_LEFT" or
		_anim isEqualTo "BRIEFING_POINT_RIGHT" or
		_anim isEqualTo "BRIEFING_POINT_TABLE" or
		_anim isEqualTo "BRIEFING"
	) exitWith {
		[
			[
				[
					GETVALUE(_anim,0)
				]
			],
			[0,[1,1,2]],
			[1,false],
			[4,["",commonNon]]
		]
	} ;
	if (_anim isEqualTo "EXERCISE") exitWith {
		[
			#define KNEBEN commonNon+"_exercisekneeBendA"
			#define PUSHUP commonNon+"_exercisePushup"
			[
				[
					[
						KNEBEN,
						PUSHUP
					]
				],
				[
					[KNEBEN]
				],
				[
					[PUSHUP]
				]
			],
			[0,[1,1,2]],
			[1,false],
			[4,["",commonNon]]
		]
	} ;

	//
	//	WARMUP
	//
	#define warmStr "Acts_AidlPercMstpSlowWrflDnon_warmup_"
	#define warmAry(num) [[warmStr+str num+"_loop"],[4,["",warmStr+str num+"_out"]]]
	#define warmPStr "Acts_AidlPercMstpSloWWpstDnon_warmup_"
	#define warmPAry(num) [[warmPStr+str num+"_loop"],[4,["",warmPStr+str num+"_out"]]]
	#define	warmUStr "Acts_AidlPercMstpSnonWnonDnon_warmup_"
	#define warmUAry(num) [[warmUStr+str num+"_loop"],[4,["",warmUStr+str num+"_out"]]]
	if (_anim isEqualTo "WARMUP") exitWith {
		[
			[
				[
					[warmStr + "01",warmStr + "02",warmStr + "03",warmStr + "04",warmStr + "05"]
				],
				warmAry(1),
				warmAry(2),
				warmAry(3),
				warmAry(4),
				warmAry(5)
			],
			[0,[3,2]]
		]
	} ;
	if (_anim isEqualTo "WARMUP_KNEEL") exitWith {
		[
			[
				warmAry(6),
				warmAry(7),
				warmAry(8)
			],
			[0,[3,2]]
		]
	} ;
	if (_anim isEqualTo "WARMUP_P") exitWith {
		[
			[
				warmPAry(1),
				warmPAry(2),
				warmPAry(3),
				warmPAry(5),
				warmPAry(6),
				warmPAry(7),
				warmPAry(8)
			],
			[0,[3,2]]
		]
	} ;
	if (_anim isEqualTo "WARMUP_KNEEL_P") exitWith {
		[
			[
				warmPAry(4)
			],
			[0,[3,2]]
		]
	} ;
	if (_anim isEqualTo "WARMUP_U") exitWith {
		[
			[
				warmUAry(1),
				warmUAry(2),
				warmUAry(3),
				warmUAry(7),
				warmUAry(8)
			],
			[0,[3,2]],
			[1,false]
		]
	} ;
	if (_anim isEqualTo "WARMUP_KNEEL_U") exitWith {
		#define WARMSTR "Acts_AidlPercMstpSnonWnonDnon_warmup"
		[
			[
				warmUAry(4),
				warmUAry(5),
				warmUAry(6)
			],
			[0,[3,2]],
			[1,false]
		]
	} ;

	//
	//	SIT
	//
	if (_anim isEqualTo "SIT") exitWith {
		[
			[
				[
					GETVALUE("SIT1",0)
				],
				[
					GETVALUE("SIT2",0)
				],
				[
					GETVALUE("SIT3",0)
				]
			],
			[0,[1,2]],
			[2,[[0,0,-0.5],-0]],
			[4,["","AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon_getOutLow"]],
			[8,{_this setPosATL (_this modelToWorld [0,0.5,0])}]
		]
	} ;
	if (_anim isEqualTo "SIT_U") exitWith {
		[
			[
				[
					GETVALUE("SIT_U1",0)
				],
				[
					GETVALUE("SIT_U2",0)
				],
				[
					GETVALUE("SIT_U3",0)
				]
			],
			[0,[1,2]],
			[1,false],
			[2,[[0,0,-0.5],-0]],
			[4,["","AcrgPknlMstpSnonWnonDnon_"+commonNon+"_getOutLow"]]
		]
	} ;
	if (
		_anim isEqualTo "SIT_HIGH" or
		_anim isEqualTo "SIT_HIGH1"
	) exitWith {
		[
			[
				[
					GETVALUE("SIT_HIGH1",0)
				]
			],
			[0,[1,2]],
			[2,[[0,0,-0.6],140]],
			[4,["","AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon_getOutLow"]]
		]
	} ;
	if (_anim isEqualTo "SIT_HIGH2") exitWith {
		[
			[
				[
					GETVALUE("SIT_HIGH2",0)
				]
			],
			[0,[1,2]],
			[2,[[0,0,-0.9],0]],
			[4,["HubSittingHighB_in","HubSittingHighB_out"]],
			[6,{
				_this setDir 0 ;
				waitUntil {animationState _this != "HubSittingHighB_in"} ;
				_this setDir -20 ;
			}],
			[8,{
				_EH = _this addEventHandler ["AnimDone",{
					if ((param [1]) == "HubSittingHighB_out") then {
						(param [0]) switchMove commonRfl ;
					} ;
				}] ;
				waitUntil {animationState _this != "HubSittingHighB_out"} ;
				_this removeEventHandler ["AnimDone",_EH] ;
			}]
		]
	} ;
	if (
		_anim isEqualTo "SIT_LOW_U" or
		_anim isEqualTo "SIT_LOW"
	) exitWith {
		#define	commonSit	"amovpsitmstpslowwrfldnon"
		#define	commFlat	"passenger_flatground_"
		[
			[
				[
					GETVALUE("SIT_LOW",0) - [commonSit],
					[4,[commonRfl+"_"+commonSit,commonSit+"_"+commonRfl]]
				],
				[
					[commFlat+"1_Idle_Idling"]
				],
				[
					[commFlat+"3_Idle_Idling"]
				],
				[
					[commFlat+"crosslegs"]
				],
				[
					[commFlat+"leanleft"],
					[2,[[0,0.5,0],0]]
				],
				[
					[commFlat+"leanright"],
					[2,[[0,0.5,0],0]]
				]
			],
			[0,[1,1,2]],
			[1,(_anim isEqualTo "SIT_LOW")],
			[4,["",[commonSit+"_"+commonRfl,"AmovPsitMstpSnonWnonDnon_"+commonNon+"_ground"] select (_anim == "SIT_LOW_U")]]
		]
	} ;
	if (_anim isEqualTo "SIT_LOW_U") exitWith {
		#define	commFlatGen(NUM)	[["passenger_flatground_generic0"+str NUM]]
		[
			[
				[
					GETVALUE("SIT_LOW_U",0),
					[4,["AmovPercMstpSnonWpstDnon_AmovPsitMstpSnonWpstDnon_ground","AmovPsitMstpSnonWnonDnon_"+commonNon+"_ground"]]
				],
				commFlatGen(1),
				commFlatGen(2),
				commFlatGen(3),
				commFlatGen(4),
				commFlatGen(5)
			],
			[0,[1,1,2]],
			[1,false],
			[4,["","AmovPsitMstpSnonWnonDnon_"+commonNon+"_ground"]]
		]
	} ;
	if (
		_anim isEqualTo "SIT_SAD1" or
		_anim isEqualTo "SIT_SAD2" or
		_anim isEqualTo "SIT_SAD"
	) exitWith {
		[
			[
				[
					GETVALUE("SIT_SAD1",0)
				],
				[
					GETVALUE("SIT_SAD2",0)
				]
			],
			[0,[1,1,2]],
			[1,false],
			[2,[[0,0,-0.3],180]],
			[4,["","AcrgPknlMstpSnonWnonDnon_"+commonNon+"_getOutLow"]]
		]
	} ;
	if (_anim isEqualTo "SIT_LOW_SAD") exitWith {
		[
			[
				[
					["Acts_CivilShocked_1"]
				],
				[
					["Acts_CivilShocked_2"]
				]
			],
			[0,[1,1,2]],
			[1,false],
			[4,["","AmovPsitMstpSnonWnonDnon_"+commonNon+"_ground"]]
		]
	} ;

	if (_anim isEqualTo "SIT_AT_TABLE") exitWith {
		[
			[
				[
					GETVALUE("SIT_AT_TABLE",0)
				]
			],
			[0,[1,1,2]],
			[1,false],
			[2,[[0,0,-0.5],0]],
			[4,["","AcrgPknlMstpSnonWnonDnon_"+commonNon+"_getOutLow"]]
		]
	} ;

	//
	//	KNEEL
	//
	if (_anim isEqualTo "KNEEL") exitWith {
		#define KNLSTR "AidlPknlMstpSlowWrflDnon_G0"
		[
			[
				[
					[KNLSTR + "1",KNLSTR + "2",KNLSTR + "3"]
				]
			],
			[0,[1,1,2]],
			[4,["AmovPknlMstpSlowWrflDnon","AmovPknlMstpSlowWrflDnon"]]
		]
	} ;
	if (_anim isEqualTo "KNEEL_U") exitWith {
		#define KNLSTR "AidlPknlMstpSnonWnonDnon_G0"
		[
			[
				[
					[KNLSTR + "1",KNLSTR + "2",KNLSTR + "3"]
				]
			],
			[0,[1,1,2]],
			[1,false],
			[4,["AmovPknlMstpSnonWnonDnon","AmovPknlMstpSnonWnonDnon"]]
		]
	} ;

	//
	//	REPAIR VEHICLE
	//
	if (_anim isEqualTo "REPAIR_VEH_PRONE") exitWith {
		[
			[
				[
					GETVALUE("REPAIR_VEH_PRONE",0)
				]
			],
			[0,[1,1,2]],
			[1,false],
			[2,[[0,0,0],-180]],
			[4,["","AinjPpneMstpSnonWnonDnon_rolltofront"]],
			[8,{_this playMove "AmovPpneMstpSnonWnonDnon"}]
		]
	} ;
	if (_anim isEqualTo "REPAIR_VEH_KNEEL") exitWith {
		[
			[
				[
					GETVALUE("REPAIR_VEH_KNEEL",0)
				]
			],
			[0,[1,1,2]],
			[1,false],
			[4,["","AmovPknlMstpSnonWnonDnon"]]
		]
	} ;
	if (_anim isEqualTo "REPAIR_VEH_STAND") exitWith {
		[
			[
				[
					GETVALUE("REPAIR_VEH_STAND",0)
				]
			],
			[0,[1,1,2]],
			[1,false],
			[4,["",commonNon]]
		]
	} ;

	if (_anim isEqualTo "CUFFED") exitWith {
		[
			#define	cuffStr "Acts_AidlPsitMstpSsurWnonDnon"
			[
				[
					[cuffStr+"01",cuffStr+"03",cuffStr+"04",cuffStr+"05"]
				]
			],
			[0,[1,1,2]],
			[1,false],
			[4,["",cuffStr+"_out"]],
			[3,{!alive _unit or {_unit getVariable ["PLP_calmSoldier_abort",false]}}]
		]
	} ;

	//
	//	INJURED HEALING AND DEAD STATES
	//
	if (
		_anim isEqualTo "PRONE_INJURED_U1" or
		_anim isEqualTo "PRONE_INJURED_U2" or
		_anim isEqualTo "PRONE_INJURED"
	) exitWith {
		[
			[
				[
					GETVALUE("PRONE_INJURED",0)
				],
				[
					GETVALUE("PRONE_INJURED_U2",0)
				]
			],
			[0,[1,2]],
			[1,false],
			[2,[[0,0,0],180]],
			[3,{!alive _unit}],
			[4,["",""]],
			[6,{_this setHitPointDamage ["HitBody",0.5]}]
		]
	} ;
	if (_anim isEqualTo "PRONE_INJURED_AGONY") exitWith {
		#define HITPART(PART)	[6,{_this setHitPointDamage [PART,0.5]}]
		[
			[
				[
					["Acts_CivilInjuredArms_1"],
					HITPART("HitArms")
				],
				[
					["Acts_CivilInjuredChest_1"],
					HITPART("HitBody")
				],
				[
					["Acts_CivilInjuredGeneral_1"],
					HITPART("HitAbdomen")
				],
				[
					["Acts_CivilInjuredHead_1"],
					HITPART("HitFace")
				],
				[
					["Acts_CivilInjuredLegs_1"],
					HITPART("HitLegs")
				]
			],
			[0,[1,2]],
			[1,false],
			[2,[[0,0,0],180]],
			[3,{!alive _unit}],
			[4,["",""]]
		]
	} ;
	if (
		_anim isEqualTo "KNEEL_TREAT_U" or
		_anim isEqualTo "KNEEL_TREAT1" or
		_anim isEqualTo "KNEEL_TREAT"
	) exitWith {
		[
			[
				[
					GETVALUE("KNEEL_TREAT",0)
				]
			],
			[0,[2]],
			[1,false],
			[4,["AinvPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_medic","AinvPknlMstpSnonWnonDnon_medicEnd"]]
		]
	} ;
	if (_anim isEqualTo "KNEEL_TREAT2") exitWith {
		[
			[
				[
					GETVALUE("KNEEL_TREAT2",0)
				]
			],
			[0,[2]],
			[4,["Acts_TreatingWounded_in","Acts_TreatingWounded_out"]]
		]
	} ;
	if (_anim isEqualTo "DEAD") exitWith {
		[
			[
				[
					["KIA_gunner_standup01","KIA_gunner_static_low01","KIA_passenger_injured_medevac_truck03"]
				]
			],
			[0,[3,2]],
			[3,{true}],
			[4,["",""]],
			[6,{_this setHitPointDamage ["HitBody",1] ; _this setHitPointDamage ["HitHead",1]}],
			[7,true]
		]
	} ;
	if (_anim isEqualTo "DEAD_AT_WALL") exitWith {
		[
			[
				[
					["KIA_commander_sdv"]
				],
				[
					["KIA_driver_MRAP_03"],
					[2,[[0,0,0.1],0]]
				],
				[
					["KIA_driver_ugv_01"]
				],
				[
					["KIA_passenger_flatground_generic"],
					[2,[[0,0,0.1],0]]
				],
				[
					["KIA_passenger_low01"],
					[2,[[0,0,0.2],0]]
				]
			],
			[0,[3,2]],
			[3,{true}],
			[4,["",""]],
			[6,{_this setHitPointDamage ["HitBody",1] ; _this setHitPointDamage ["HitHead",1]}],
			[7,true]
		]
	} ;
	["%1 is not available paramater",_anim] call BIS_fnc_error ;
	nil
} ;
if (isNil "_data") exitWith {} ;	//TERMINATE THE SCRIPT WHEN DATA IS NOT DEFINED

//	-----------------------------------
//	PRE-EXECUTION: INITIALIZATION
//	-----------------------------------
private ["_lastData","_anim","_inMove","_outMove","_hasWeapon","_direction","_position","_condition","_ignoreAnim","_unreact","_afterExec"] ;

if (!isNil "_index") then {
	_lastData = (_data select 0) select _index ;
} else {
	_lastData = selectRandom (_data select 0) ;
} ;

_data deleteAt 0 ;
_anim = _lastData select 0 ;
_lastData = (_lastData + _data) ;

//	Normalize _loadOption before use
switch _loadOption do {
	case "ASIS" : {
		_loadOption = 4 ;
	} ;
	case "LIGHT" : {
		_loadOption = 1 ;
	} ;
	case "MEDIUM" : {
		_loadOption = 2 ;
	} ;
	case "FULL" : {
		_loadOption = 3 ;
	} ;
} ;

{	//	Bring datas from selected animation data
	if (_forEachIndex >= 1) then {
		_x params [
			"_index",
			"_value"
		] ;
		call {
			if (_index == 0) exitWith {
				if (_loadOption == -1) then {
					_loadOption = (selectRandom _value) ;
				} ;
			} ;
			if (_index == 1) exitWith {
				if (!_value) then {
					_unit removeWeapon primaryWeapon _unit ;
				} ;
			} ;
			if (_index == 2) exitWith {
				_value params [
					"_pos",
					"_dir"
				] ;
				_position = _pos ;
				_direction = _dir ;
			} ;
			if (_index == 3) exitWith {
				if (isNil "_condition") then {
					_condition = _value ;
				} ;} ;
			if (_index == 4) exitWith {
				_inMove = (_value select 0) ;
				_outMove = (_value select 1) ;
			} ;
			if (_index == 5) exitWith {
				_ignoreAnim = _value ;
			} ;
			if (_index == 6) exitWith {
				if (typeName _value == "CODE") then {
					_unit spawn _value ;
				} else {
					[_unit,(_value param [1])] spawn (_value param [0])
				} ;
			} ;
			if (_index == 7) exitWith {
				_unreact = _value ;
			} ;
			if (_index == 8) exitWith {
				_afterExec = _value ;
			} ;
		} ;
	} ;
} forEach _lastData ;

//	-----------------------------------
//	SET DEFAULT IF THE VALUES NOT DEFINED
//	-----------------------------------
if (isNil "_hasWeapon") then {
	_hasWeapon = true ;
} ;
if (isNil "_position") then {
	_position = [0,0,0] ;
} ;
if (isNil "_direction") then {
	_direction = 0 ;
} ;
if (isNil "_condition") then {
	_condition = {!alive _unit or {unitReady _unit} or {getSuppression _unit != 0} or {_unit getVariable ["PLP_calmSoldier_abort",false]} or {_unit call BIS_fnc_enemyDetected}} ;
} ;
if (isNil "_inMove" or {isNil "_outMove"}) then {
	_inMove = "Stand" ;
	_outMove = "Stand" ;
} ;
if (isNil "_ignoreAnim") then {
	_ignoreAnim = true ;
} ;

//	-----------------------------------
//	PRE-EXECUTION UNIT SETTINGS
//	-----------------------------------
#define SWITCHMOVE_MP(ANIM)	([_unit,ANIM] remoteExec ["switchMove", 0, true])
#define PLAYMOVENOW_MP(ANIM)	([_unit,ANIM] remoteExec ["playMoveNow", _unit, true])

//	Remove some equipments by order
if (!_hasWeapon) then {
	_unit removeWeapon primaryWeapon _unit ;
} ;

if (_loadOption <= 3) then {
	_unit unassignItem hmd _unit ;
	removeGoggles _unit ;
} ;
if (_loadOption <= 2) then {
	removeHeadgear _unit ;
} ;
if (_loadOption <= 1) then {
	removeVest _unit ;
	removeBackpack _unit ;
} ;

//	Attach the unit
if (count (synchronizedObjects _unit) != 0 or !isNull _attachObj) then {
	if (isNull _attachObj) then {
		_attachObj = ((synchronizedObjects _unit) select 0) ;
	} ;
	_vehDir = getDir _attachObj ;
	_unit attachTo [_attachObj,(_attachObj worldToModel getPosATL _unit) vectorAdd _position] ;
	_unit setDir ((_origDir - _vehDir) + _direction) ;
} else {
	_logicGrp = createGroup side _unit ;
	_attachDummy = _logicGrp createUnit ["Logic",[0,0,0],[],0,"CAN_COLLIDE"] ;
	_unit setPosASL _origPos ;
	_unit setDir _origDir ;
	_attachDummy setPosATL (_unit modelToWorld _position) ;
	_attachDummy setDir _origDir ;
	_unit attachTo [_attachDummy,[0,0,0]] ;
	_unit setDir _direction ;
} ;

_unit enableSimulationGlobal true ;
if (!isNil "_unreact" and {_unreact}) exitWith {
	_unit disableConversation true ;
	SWITCHMOVE_MP(selectRandom _anim) ;
} ;

//	EH initialization
_unit setVariable ["PLP_calmSoldier_anims",_anim] ;
_unit setVariable ["PLP_calmSoldier_animDoneCoef",0] ;
_unitEHDone = _unit addEventHandler ["AnimDone",{
	_unit = param [0] ;
	if ((_unit getVariable "PLP_calmSoldier_animDoneCoef") == 0) then {
		_unit setVariable ["PLP_calmSoldier_animDoneCoef",1] ;
	} else {
		_unit setVariable ["PLP_calmSoldier_animDoneCoef",0] ;
	} ;
}] ;

//	Make AI stop and start move
_unit setBehaviour "SAFE" ;
doStop _unit ;
{_unit disableAI _x} forEach ["MOVE","TARGET","AUTOTARGET","ANIM","FSM"] ;
if (_smoothIn and {_inMove != ""}) then {
	SWITCHMOVE_MP(_inMove) ;
} else {
	SWITCHMOVE_MP(selectRandom _anim) ;
} ;
_unit setAnimSpeedCoef (0.8 + random 0.4) ;

//	Abandon some used value for memory release
{
	_x = nil ;
} forEach [_data,_inMove,_loadOption,_hasWeapon,_direction] ;

//	Find loop and out
_loopAnim = "" ;
_playMove = false ;
#define 	ANIMBASE(ANIM)	((getArray (configfile >> "CfgMovesMaleSdr" >> "States" >> ANIM >> "InterpolateTo")) + (getArray (configfile >> "CfgMovesMaleSdr" >> "States" >> ANIM >> "ConnectTo")))
{
	if ((typeName _x == "STRING") and {(_x find _outMove != -1) or {(_x find "_loop") != -1}}) exitWith {
		if (toUpper _x isEqualTo toUpper _outMove) then {
			_playMove = true ;
		} else {
			_loopAnim = _x ;
			{
				if (typename _x isEqualTo "STRING") then {
					if (toUpper _x isEqualTo toUpper _outMove) exitWith {
						_playMove = true ;
					} ;
				}
			} forEach ANIMBASE(_loopAnim) ;
		} ;
	}
} forEach ANIMBASE(animationState _unit) ;

//	Main part
while {true} do {
	_nowCoef = (_unit getVariable "PLP_calmSoldier_animDoneCoef") ;
	waitUntil {call _condition or {!alive _unit} or {_nowCoef != (_unit getVariable "PLP_calmSoldier_animDoneCoef")}} ;
	if (call _condition) exitWith {} ;
	SWITCHMOVE_MP(selectRandom _anim) ;
} ;
CHATLOG((str param [1]) + " ended")
//	-----------------------------------
//	POST-EXECUTION: LEAVE THE ANIMATION
//	-----------------------------------

CHATLOG("detach sequence")

if (alive _unit) then {
	sleep (0.1 + random 0.4) ;
	_unit setDir 0 ;
	if (!isNil "_attachDummy") then {
		_attachDummy setPosATL (_attachDummy modelToWorld (_position vectorMultiply -1)) ;
		waitUntil {getDir _attachDummy == getDir _unit} ;
	} ;
} ;

detach _unit ;
if (!isNil "_attachDummy") then {
	deleteVehicle _attachDummy ;
} ;

if (!isNil "_afterExec") then {
	_unit spawn _afterExec ;
} ;

if (alive _unit or {!_ignoreAnim}) then {
	if (_playMove) then {
		CHATLOG("playMove")
		PLAYMOVENOW_MP(_loopAnim) ;
		PLAYMOVENOW_MP(_outMove) ;
	} else {
		CHATLOG("switchMove")
		SWITCHMOVE_MP(_outMove) ;
	} ;
	//_nowCoef = (_unit getVariable "PLP_calmSoldier_animDoneCoef") ;
	//waitUntil {_nowCoef != (_unit getVariable "PLP_calmSoldier_animDoneCoef")} ;
} ;

_unit setBehaviour "AWARE" ;
{_unit enableAI _x} forEach ["MOVE","TARGET","AUTOTARGET","ANIM","FSM"] ;
if !(formationLeader _unit isEqualTo leader _unit) then {
	_unit doFollow leader _unit ;
} ;

_unit setAnimSpeedCoef 1 ;
_unit removeEventHandler ["AnimDone",_unitEHDone] ;

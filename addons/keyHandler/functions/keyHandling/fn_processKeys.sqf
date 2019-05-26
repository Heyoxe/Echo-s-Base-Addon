/*
_EBA_keyHandler_keyRegistery = 
[
	[
		"CBA_previousRail", 
		"CBA_nextRail",
		"ESE_keysConfig_openMenu"
	], 
	[
		[
			["LEFT_CTRL", "R", "R"], 
			["RIGHT_CTRL", "R", "R"]
		], 
		[
			["LEFT_SHIFT", "R", "R"], 
			["RIGHT_SHIFT", "R", "R"]
		],
		[
			[17, 17]
		]
	]
];

profileNamespace setVariable ["EBA_keyHandler_keyRegistery", _EBA_keyHandler_keyRegistery];
saveProfileNamespace
*/
params ["_EBA_keyHandler_keysArray"];
_keysConfigs = configProperties [configFile >> "EBA_keysConfig_M", "true"];
_EBA_keyHandler_keysRegistery = (profileNamespace getVariable "EBA_keyHandler_keyRegistery");
{
	_config = _x;
	_addonName = configName _config;
	_actionList = "true" configClasses (_config/"actions");
	{
		_action = _x;
		_actionName = configName _action;
		_keyRegisteryIndex = (_EBA_keyHandler_keysRegistery#0) findIf {_x isEqualTo (format ["%1_%2", _addonName, _actionName])};
		_keyRegistery = [{_EBA_keyHandler_keysRegistery#1#_keyRegisteryIndex}, {getArray (_action/"defaultKeys")}] select (_keyRegisteryIndex isEqualTo -1);
		_keyCombinaison = call _keyRegistery;
		_script = (getText (_action/"script"));
		{
			_keys = _x;
			_consolidatedArray = _keys call BIS_fnc_consolidateArray;
			_doubledKeyIndex = (_consolidatedArray findIf {_x#1 isEqualTo 2});
			_doubledKey = [{_consolidatedArray#_doubledKeyIndex#0}, {0}] select (_doubledKeyIndex isEqualTo -1);
			_doubledKey = call _doubledKey;
			_tempNum = 0;
			if ((count _keys) > 3) exitWith {};
			{
				_key = _x;
				_nowPressed = _EBA_keyHandler_keysArray#_key#0#0;
				_nowDoubled = _EBA_keyHandler_keysArray#_key#0#1;
				_conditions = [_nowPressed, (_nowPressed && _nowDoubled)] select (_doubledKey isEqualTo _key);
				_tempNum = [_tempNum, (_tempNum + 1)] select _conditions;
			} forEach _keys;
			[] call (compile (["", _script] select (_tempNum isEqualTo (count _keys))));
		} forEach _keyCombinaison;
	} forEach _actionList;
} forEach _keysConfigs;


[] spawn {
	disableSerialization;
	_display = (findDisplay 46) createDisplay "RscDisplayEmpty";
	
	_Background = _display ctrlCreate ["IGUIBack", 2210];
	_Background ctrlSetPosition [0.267969 * safezoneW + safezoneX, 0.269 * safezoneH + safezoneY, 0.464062 * safezoneW, 0.484 * safezoneH];
	_Background ctrlSetTextColor [0,1,1,0.5];
	_Background ctrlSetBackgroundColor [0,1,1,0.5];
	_Background ctrlSetActiveColor [0,1,1,0.5];
	_Background ctrlCommit 0;

	_KeyList = _display ctrlCreate ["IGUIBack", 2200];
	_KeyList ctrlSetPosition [0.273125 * safezoneW + safezoneX, 0.346 * safezoneH + safezoneY, 0.309375 * safezoneW, 0.374 * safezoneH];
	_KeyList ctrlSetTextColor [0,1,0,1];
	_KeyList ctrlSetBackgroundColor [0,1,0,1];
	_KeyList ctrlSetActiveColor [0,1,0,1];
	_KeyList ctrlCommit 0;

	_KeyInfo = _display ctrlCreate ["IGUIBack", 2201];
	_KeyInfo ctrlSetPosition [0.587656 * safezoneW + safezoneX, 0.346 * safezoneH + safezoneY, 0.139219 * safezoneW, 0.374 * safezoneH];
	_KeyInfo ctrlSetTextColor [0,1,0,1];
	_KeyInfo ctrlSetBackgroundColor [0,1,0,1];
	_KeyInfo ctrlSetActiveColor [0,1,0,1];
	_KeyInfo ctrlCommit 0;

	_Select = _display ctrlCreate ["IGUIBack", 2202];
	_Select ctrlSetPosition [0.273125 * safezoneW + safezoneX, 0.313 * safezoneH + safezoneY, 0.309375 * safezoneW, 0.022 * safezoneH];
	_Select ctrlSetTextColor [0,1,0,1];
	_Select ctrlSetBackgroundColor [0,1,0,1];
	_Select ctrlSetActiveColor [0,1,0,1];
	_Select ctrlCommit 0;

	_KeyInfoTitle = _display ctrlCreate ["IGUIBack", 2203];
	_KeyInfoTitle ctrlSetPosition [0.587656 * safezoneW + safezoneX, 0.313 * safezoneH + safezoneY, 0.139219 * safezoneW, 0.022 * safezoneH];
	_KeyInfoTitle ctrlSetTextColor [0,1,0,1];
	_KeyInfoTitle ctrlSetBackgroundColor [0,1,0,1];
	_KeyInfoTitle ctrlSetActiveColor [0,1,0,1];
	_KeyInfoTitle ctrlCommit 0;

	_Save = _display ctrlCreate ["IGUIBack", 2206];
	_Save ctrlSetPosition [0.649531 * safezoneW + safezoneX, 0.731 * safezoneH + safezoneY, 0.0825 * safezoneW, 0.022 * safezoneH];
	_Save ctrlSetTextColor [1,0,0,1];
	_Save ctrlSetBackgroundColor [1,0,0,1];
	_Save ctrlSetActiveColor [1,0,0,1];
	_Save ctrlCommit 0;

	_Title = _display ctrlCreate ["IGUIBack", 2207];
	_Title ctrlSetPosition [0.267969 * safezoneW + safezoneX, 0.247 * safezoneH + safezoneY, 0.464062 * safezoneW, 0.022 * safezoneH];
	_Title ctrlSetTextColor [1,0,0,1];
	_Title ctrlSetBackgroundColor [1,0,0,1];
	_Title ctrlSetActiveColor [1,0,0,1];
	_Title ctrlCommit 0;

	_Configure = _display ctrlCreate ["RscButton", 2208];
	_Configure ctrlSetPosition [0.267969 * safezoneW + safezoneX, 0.28 * safezoneH + safezoneY, 0.103125 * safezoneW, 0.022 * safezoneH];
	_Configure ctrlSetTextColor [1,0,0,1];
	_Configure ctrlSetBackgroundColor [1,0,0,1];
	_Configure ctrlSetActiveColor [1,0,0,1];
	_Configure ctrlCommit 0;

	_Debug = _display ctrlCreate ["RscButton", 2209];
	_Debug ctrlSetPosition [0.37625 * safezoneW + safezoneX, 0.28 * safezoneH + safezoneY, 0.103125 * safezoneW, 0.022 * safezoneH];
	_Debug ctrlSetTextColor [1,0,0,1];
	_Debug ctrlSetBackgroundColor [1,0,0,1];
	_Debug ctrlSetActiveColor [1,0,0,1];
	_Debug ctrlCommit 0;

	_Cancel = _display ctrlCreate ["RscButton", 2204];
	_Cancel ctrlSetPosition [0.267969 * safezoneW + safezoneX, 0.731 * safezoneH + safezoneY, 0.103125 * safezoneW, 0.022 * safezoneH];
	_Cancel ctrlSetTextColor [1,0,0,1];
	_Cancel ctrlSetBackgroundColor [1,0,0,1];
	_Cancel ctrlSetActiveColor [1,0,0,1];
	_Cancel ctrlCommit 0;

	_Reset = _display ctrlCreate ["RscButton", 2205];
	_Reset ctrlSetPosition [0.37625 * safezoneW + safezoneX, 0.731 * safezoneH + safezoneY, 0.103125 * safezoneW, 0.022 * safezoneH];
	_Reset ctrlSetTextColor [1,0,0,1];
	_Reset ctrlSetBackgroundColor [1,0,0,1];
	_Reset ctrlSetActiveColor [1,0,0,1];
	_Reset ctrlCommit 0;
};
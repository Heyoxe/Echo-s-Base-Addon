/*
_EBA_keyHandler_keyRegistery = 
[
	[
		"ESE_keysConfig_openMenu",
		"ESE_keysConfig_openMenu2"
	], 
	[
		[
			[17, 18],
			[27]
		],
		[
			[11, 40, 32]
		]
	]
];

profileNamespace setVariable ["EBA_keyHandler_keyRegistery", _EBA_keyHandler_keyRegistery];
saveProfileNamespace;
*/
params ["_EBA_keyHandler_keysArray"];
if (dialog) exitWith {};
_keysConfigs = configProperties [configFile >> "EBA_keysConfig_M", "true"];
_EBA_keyHandler_keysRegistery = (profileNamespace getVariable ["EBA_keyHandler_keyRegistery", [[], []]]);
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
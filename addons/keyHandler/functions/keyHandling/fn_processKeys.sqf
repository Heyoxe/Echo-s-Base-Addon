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
			[17]
		]
	]
];
*/

EBA_fnc_processKeys = {
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
		_keyRegistery = (_EBA_keyHandler_keysRegistery#0) findIf {_x isEqualTo (format ["%1_%2", _addonName, _actionName])};
		_keyRegistery = [{_EBA_keyHandler_keysRegistery#1#_keyRegistery}, {getArray (_action/"defaultKeys")}] select (_keyRegistery isEqualTo -1);
		_keyCombinaison = call _keyRegistery;
		_singleFire = [false, true] select (getNumber (_action/"singleFire"));
		_script = (getText (_action/"script"));
		{
			_keys = _x;
			_tempNum = 0;
			_consolidatedArray = _keys call BIS_fnc_consolidateArray;
			_doubledKeyIndex = (_consolidatedArray findIf {_x#1 isEqualTo 2});
			_doubledKey = [{_consolidatedArray#_doubledKeyIndex#0}, {0}] select (_doubledKeyIndex isEqualTo -1);
			_doubledKey = call _doubledKey;
			{
				_key = _x;
				_beforeUp = _EBA_keyHandler_keysArray#_key#1#3;
				_tempNum = [(_tempNum + 1), _tempNum] select _beforePressed;
			} forEach _keys;
			_extraConditions = [false, true] select (_tempNum != 0);
			_tempNum = 0;
			if ((count _keys) > 3) exitWith {
				systemChat format ["%1: Too much keys, processing skipped...", diag_tickTime];
			};
			{
				_key = _x;
				_nowPressed = _EBA_keyHandler_keysArray#_key#0#0;
				_nowDoubled = _EBA_keyHandler_keysArray#_key#0#1;
				_baseConditions = [_nowPressed, (_nowPressed && _nowDoubled)] select (_doubledKey isEqualTo _key);
				_conditions = [_baseConditions, (_baseConditions && _extraConditions)] select _singleFire;
				_tempNum = [_tempNum, (_tempNum + 1)] select _conditions;
			} forEach _keys;
			[] call (compile (["", _script] select (_tempNum isEqualTo (count _keys))));
		} forEach _keyCombinaison;
	} forEach _actionList;
} forEach _keysConfigs;
};

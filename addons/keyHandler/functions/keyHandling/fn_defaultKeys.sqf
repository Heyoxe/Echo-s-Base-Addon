params ["_mode", "_addonName", ["_actionName", ""]];
_EBA_keyHandler_keysRegistery = (profileNamespace getVariable ["EBA_keyHandler_keyRegistery", [[], []]]);
switch _mode do {
	case 1: {
		_keyRegisteryIndex = (_EBA_keyHandler_keysRegistery#0) findIf {_x isEqualTo (format ["%1_%2", _addonName, _actionName])};
		if (_keyRegisteryIndex isEqualTo -1) exitWith {};

		_actions = _EBA_keyHandler_keysRegistery#0;
		_keys = _EBA_keyHandler_keysRegistery#1;
		_actions deleteAt _keyRegisteryIndex;
		_keys deleteAt _keyRegisteryIndex;
		_EBA_keyHandler_keysRegistery = [_actions, _keys];

		profileNamespace setVariable ["EBA_keyHandler_keyRegistery", _EBA_keyHandler_keysRegistery];
		saveProfileNamespace;
	};

	case 0: {
		_config = configFile >> "EBA_keysConfig_M" >> _addonName;
		_actionList = "true" configClasses (_config/"actions");
		{
			_action = _x;
			_actionName = configName _action;
			_keyRegisteryIndex = (_EBA_keyHandler_keysRegistery#0) findIf {_x isEqualTo (format ["%1_%2", _addonName, _actionName])};
			if (_keyRegisteryIndex isEqualTo -1) exitWith {};

			_actions = _EBA_keyHandler_keysRegistery#0;
			_keys = _EBA_keyHandler_keysRegistery#1;
			_actions deleteAt _keyRegisteryIndex;
			_keys deleteAt _keyRegisteryIndex;
			_EBA_keyHandler_keysRegistery = [_actions, _keys];

		} forEach _actionList;
		profileNamespace setVariable ["EBA_keyHandler_keyRegistery", _EBA_keyHandler_keysRegistery];
		saveProfileNamespace;
	};
};


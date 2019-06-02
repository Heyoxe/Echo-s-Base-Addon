params ["_addonName", ["_actionName", ""]];
_EBA_keyHandler_keysRegistery = (profileNamespace getVariable ["EBA_keyHandler_keyRegistery", [[], []]]);
_KeyList = (findDisplay 19943) getVariable "EBA_KeyList";
_index = lbCurSel _KeyList;
_KeyList lbDelete _index;

systemChat str _index;

_keyRegisteryIndex = (_EBA_keyHandler_keysRegistery#0) findIf {_x isEqualTo (format ["%1_%2", _addonName, _actionName])};
if (_keyRegisteryIndex isEqualTo -1) then {
	_action = configFile >> "EBA_keysConfig_M" >> _addonName >> "actions" >> _actionName;
	_actionList = getArray (_action/"defaultKeys");

	_actionList deleteAt _index;

	_actions = _EBA_keyHandler_keysRegistery#0;
	_keys = _EBA_keyHandler_keysRegistery#1;

	_actions pushBack (format ["%1_%2", _addonName, _actionName]);
	_keys pushBack _actionList;

	_EBA_keyHandler_keysRegistery = [_actions, _keys];

	profileNamespace setVariable ["EBA_keyHandler_keyRegistery", _EBA_keyHandler_keysRegistery];
	saveProfileNamespace;
} else {
	_actionList = _EBA_keyHandler_keysRegistery#1#_keyRegisteryIndex;
	_actionList deleteAt _index;

	_actions = _EBA_keyHandler_keysRegistery#0;
	_keys = _EBA_keyHandler_keysRegistery#1;

	_actions deleteAt _keyRegisteryIndex;
	_keys deleteAt _keyRegisteryIndex;

	_actions pushBack (format ["%1_%2", _addonName, _actionName]);
	_keys pushBack _actionList;

	_EBA_keyHandler_keysRegistery = [_actions, _keys];

	profileNamespace setVariable ["EBA_keyHandler_keyRegistery", _EBA_keyHandler_keysRegistery];
	saveProfileNamespace;
};
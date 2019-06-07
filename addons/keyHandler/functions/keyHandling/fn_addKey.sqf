
params ["_addedKeys"];
((findDisplay 19943) getVariable "EBA_KeyList_Info") params ["_addonName", "_actionName"];

_EBA_keyHandler_keysRegistery = (profileNamespace getVariable ["EBA_keyHandler_keyRegistery", [[], []]]);
_keyRegisteryIndex = (_EBA_keyHandler_keysRegistery#0) findIf {_x isEqualTo (format ["%1_%2", _addonName, _actionName])};
if (_keyRegisteryIndex isEqualTo -1) then {
	_action = configFile >> "EBA_keysConfig_M" >> _addonName >> "actions" >> _actionName;
	_actionList = getArray (_action/"defaultKeys");

	_addedKeys deleteAt 0;
	if (_addedKeys in _actionList) exitWith {};
	_actionList pushBack _addedKeys;

	_actions = _EBA_keyHandler_keysRegistery#0;
	_keys = _EBA_keyHandler_keysRegistery#1;

	_actions pushBack (format ["%1_%2", _addonName, _actionName]);
	_keys pushBack _actionList;

	_EBA_keyHandler_keysRegistery = [_actions, _keys];

	profileNamespace setVariable ["EBA_keyHandler_keyRegistery", _EBA_keyHandler_keysRegistery];
	saveProfileNamespace;
} else {
	_actionList = _EBA_keyHandler_keysRegistery#1#_keyRegisteryIndex;
	_addedKeys deleteAt 0;
	if (_addedKeys in _actionList) exitWith {};
	_actionList pushBack _addedKeys;

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
[1, _addonName, _actionName] spawn EBA_fnc_createDialog;
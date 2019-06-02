params ["_KeyList", "_addonName", "_actionName"];
_EBA_keyHandler_keysRegistery = (profileNamespace getVariable ["EBA_keyHandler_keyRegistery", [[], []]]);
_action = configFile >> "EBA_keysConfig_M" >> _addonName >> "actions" >> _actionName;
_keyRegisteryIndex = (_EBA_keyHandler_keysRegistery#0) findIf {_x isEqualTo (format ["%1_%2", _addonName, _actionName])};
_keyRegistery = [{_EBA_keyHandler_keysRegistery#1#_keyRegisteryIndex}, {getArray (_action/"defaultKeys")}] select (_keyRegisteryIndex isEqualTo -1);
_keyCombinaison = call _keyRegistery;

_string = "";
_tempOutput = [];
{
	_keys = _x;
	_keys sort false;
	_string = "";
	_temp = [];
	_consolidatedArray = _keys call BIS_fnc_consolidateArray;
	_doubledKeyIndex = (_consolidatedArray findIf {_x#1 isEqualTo 2});
	_doubledKey = 0;
	if (_doubledKeyIndex isEqualTo -1) then {
		_doubledKey = 0;
	} else {
		_doubledKey = (_consolidatedArray#_doubledKeyIndex#0);
	};

	_doubledKeyString = keyName _doubledKey;
	_doubledKeyString = _doubledKeyString splitString """";

	if !((count _doubledKeyString) isEqualTo 0) then {
		_doubledKeyString = format ["2x%1", _doubledKeyString#0];
	} else {
		_doubledKeyString = "";
	};

	{
		_key = _x;
		if (_key isEqualTo _doubledKey) then {} else {
			_key = (keyName _key) splitString """";
			_temp pushBack _key#0;
		};
	} forEach _keys;

	_temp pushBack _doubledKeyString;
	
	{
		_key = _x;
		if (_key isEqualTo "") exitWith {};
		_add = ["+", ""] select (_forEachIndex isEqualTo 0);
		_string = format ["%1%2%3", _string, _add, _key];
	} forEach _temp;
	_tempOutput pushBack _string;
} forEach _keyCombinaison; 

{
	_KeyList lbAdd _x;
} forEach _tempOutput;
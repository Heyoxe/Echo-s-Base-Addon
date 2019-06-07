params ["_category"];
_KeyList = (findDisplay 19943) getVariable "EBA_KeyList";
ctClear _KeyList;
_EBA_keyHandler_keysRegistery = (profileNamespace getVariable ["EBA_keyHandler_keyRegistery", [[], []]]);
_config = (configFile >> "EBA_keysConfig_M" >> _category);
_addonName = configName _config;
_actionList = "true" configClasses (_config/"actions");
{
	_action = _x;
	_actionName = configName _action;
	_actionText = getText (_action/"name");
	_actionTooltip = getText (_action/"tooltip");
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
	_string = "";
	{
		_keys = _x;
		_add = [", ", ""] select (_forEachIndex isEqualTo 0);
		_string = format ["%1%2%3", _string, _add, str _keys];
	} forEach _tempOutput;
	_row = (ctAddRow _KeyList)#1;
	_row params ["_columnAction", "_columnAssignedKeys", "_columnRow"];
	_columnAction ctrlSetText _actionText;
	_columnAssignedKeys ctrlSetText _string;

	_call = format ["[1, %1, %2] call EBA_fnc_createDialog", str _addonName, str _actionName];
	_columnRow ctrlSetTooltip _actionTooltip;
	_disabled = [false, true] select (getNumber (_action/"disable"));
	if (_disabled) then {
		_columnAction ctrlSetTextColor [0.5, 0.5, 0.5, 1];
		_columnAssignedKeys ctrlSetTextColor [0.5, 0.5, 0.5, 1];	
		_call = "";
	};
	_columnRow ctrlSetEventHandler ["ButtonClick", _call];
} forEach _actionList;
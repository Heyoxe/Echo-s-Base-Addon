params ["_categoryList", "_default"];
_keysConfigs = configProperties [configFile >> "EBA_keysConfig_M", "true"];
{
	_config = _x;
	_configName = configName _config;
	_name = getText (_config/"name");
	_tooltip = getText (_config/"tooltip");
	_item = _categoryList lbAdd _name;
	_categoryList lbSetTooltip [_item, _tooltip];
	_categoryList lbSetData [_item, _configName];
} forEach _keysConfigs;
_selectedIndex = missionNamespace getVariable ["EBA_keyHandler_categoryLastIndex", 0];
_categoryList lbSetCurSel _selectedIndex;
_category = _categoryList lbData _selectedIndex;
[_category] call EBA_fnc_populateTable;
_Default = (findDisplay 19943) displayCtrl 2206;
_call = format ["closeDialog 0; [0, %1] spawn EBA_fnc_defaultKeys", str _category];
_Default ctrlSetEventHandler ["ButtonClick", _call];

_categoryList ctrlAddEventHandler ["LBSelChanged", {
	params ["_control", "_selectedIndex"];
	_category = _control lbData _selectedIndex;
	EBA_keyHandler_categoryLastIndex = _selectedIndex;
	[_category] call EBA_fnc_populateTable;

	_Default = (findDisplay 19943) displayCtrl 2206;
	_call = format ["closeDialog 0; [0, %1] spawn EBA_fnc_defaultKeys", str _category];
	_Default ctrlSetEventHandler ["ButtonClick", _call];
}];
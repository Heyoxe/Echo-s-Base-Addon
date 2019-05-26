#include "..\mod_defines.h"
systemChat "Checking Configs...";

_keysConfigs = configProperties [configFile >> "EBA_keysConfig_M", "true"];
{
	_config = _x;

	_categoryName = getText (_config/"name");
	if (_categoryName isEqualTo "") exitWith {
		[ADDON, _config, "name"] spawn EBA_fnc_keyHandler_system_throw;
	};

	_categoryTooltip = getText (_config/"tooltip");
	if (_categoryName isEqualTo "") exitWith {
		[ADDON, _config, "tooltip"] spawn EBA_fnc_keyHandler_system_throw;
	};

	_actionList = "true" configClasses (_config/"actions");
	if (_actionList isEqualTo []) exitWith {
		[ADDON, _config, "actions"] spawn EBA_fnc_keyHandler_system_throw;
	};

	{
		_action = _x;
		_actionName = getText (_action/"name");
		if (_actionName isEqualTo "") exitWith {
			[ADDON, _config, "name"] spawn EBA_fnc_keyHandler_system_throw;
		};
		_actionName = getText (_action/"tooltip");
		if (_actionName isEqualTo "") exitWith {
			[ADDON, _config, "tooltip"] spawn EBA_fnc_keyHandler_system_throw;
		};
		_defaultKeys = getArray (_action/"defaultKeys");
		if (_defaultKeys isEqualTo []) exitWith {
			[ADDON, _config, "script"] spawn EBA_fnc_keyHandler_system_warn;
		};
		_defaultKeys = getArray (_action/"defaultKeys");
		if (_defaultKeys isEqualTo []) exitWith {
			[ADDON, _config, "defaultKeys"] spawn EBA_fnc_keyHandler_system_warn;
		};
	} forEach _actionList;
} forEach _keysConfigs;
systemChat "Configs are Safe!";
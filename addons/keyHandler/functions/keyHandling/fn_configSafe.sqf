#include "..\..\mod_defines.h"
_keysConfigs = configProperties [configFile >> "EBA_keysConfig_M", "true"];
{
	_config = _x;

	_categoryName = getText (_config/"name");
	if (_categoryName isEqualTo "") exitWith {
		[ADDON, _config, "name"] call EBA_fnc_throw;
	};

	_categoryTooltip = getText (_config/"tooltip");
	if (_categoryName isEqualTo "") exitWith {
		[ADDON, _config, "tooltip"] call EBA_fnc_throw;
	};

	_actionList = "true" configClasses (_config/"actions");
	if (_actionList isEqualTo []) exitWith {
		[ADDON, _config, "actions"] call EBA_fnc_throw;
	};

	{
		_action = _x;
		_actionName = getText (_action/"name");
		if (_actionName isEqualTo "") exitWith {
			[ADDON, _config, "name"] call EBA_fnc_throw;
		};
		_actionName = getText (_action/"tooltip");
		if (_actionName isEqualTo "") exitWith {
			[ADDON, _config, "tooltip"] call EBA_fnc_throw;
		};
		_defaultKeys = getText (_action/"script");
		if (_defaultKeys isEqualTo "") exitWith {
			[ADDON, _config, "script"] call EBA_fnc_warn;
		};
		_defaultKeys = getArray (_action/"defaultKeys");
		if (_defaultKeys isEqualTo []) exitWith {
			[ADDON, _config, "defaultKeys"] call EBA_fnc_warn;
		};
	} forEach _actionList;
} forEach _keysConfigs;
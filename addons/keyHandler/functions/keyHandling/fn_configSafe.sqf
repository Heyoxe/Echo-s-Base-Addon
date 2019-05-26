#include "..\..\mod_defines.h"
_keysConfigs = configProperties [configFile >> "EBA_keysConfig_M", "true"];
{
	_config = _x;
	_textChecks = ["name", "tooltip"];
	{
		_checkedText = getText (_config/_x);
		if (_checkedText isEqualTo "") exitWith {
			[ADDON, _config, _x] call EBA_fnc_throw;
		};
	} forEach _textChecks;

	_actionList = "true" configClasses (_config/"actions");
	if (_actionList isEqualTo []) exitWith {
		[ADDON, _config, "actions"] call EBA_fnc_throw;
	};

	{
		_action = _x;
		_textChecks = ["name", "tooltip", "script"];
		{
			_checkedText = getText (_action/_x);
			if (_checkedText isEqualTo "") exitWith {
				[ADDON, _action, _x] call EBA_fnc_throw;
			};
		} forEach _textChecks;

		_defaultKeys = getArray (_action/"defaultKeys");
		if (_defaultKeys isEqualTo []) exitWith {
			[ADDON, _action, "defaultKeys"] call EBA_fnc_warn;
		};
	} forEach _actionList;
} forEach _keysConfigs;
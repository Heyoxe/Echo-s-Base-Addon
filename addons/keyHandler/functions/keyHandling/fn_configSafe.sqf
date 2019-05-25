EBA_fnc_keyHandler_system_throw = {
	params ["_addon", "_value", "_config"];
	diag_log format ["[EBA::%1::WARNING] Empty or Undefined Class in %2/%3", _addon, _config, _value];
	while {true} do {
		_text = format [
			"
			<t color=""#EA2027"" size=""3"" font=""RobotoCondensedBold"">EBA Encountered a Critical Error!</t>
			<br/>
			<t size=""1.5"" font=""RobotoCondensedBold"">System: <t <t color=""#F79F1F"">%1</t>.</t>
			<br/>
			<br/>
			Empty or Undefined Class in <t color=""#F79F1F"" font=""RobotoCondensedBold"">%2/%3</t>.
			<br/>
			<br/>
			Please Close the Game and make sure that your files are not corrupted.
			<br/>
			If the problem persist, please contant the Developper.
			",
			_addon,
			_config,
			_value
		];
		cutText [_text, "BLACK FADED", -1, true, true];
	};
};

_keysConfigs = configProperties [configFile >> "EBA_keysConfig_M", "true"];
{
	_config = _x;

	//Check Name
	_categoryName = getText (_config/"nam");
	if (_categoryName isEqualTo "") exitWith {
		["KeyHandler", "name", _config] spawn EBA_fnc_keyHandler_system_throw;
	};

	//Check Tooltip
	_categoryTooltip = getText (_config/"tooltip");
	if (_categoryName isEqualTo "") exitWith {
		["tooltip", _config] spawn EBA_fnc_keyHandler_system_throw;
	};

	//Check Actions List
	_actionList = "true" configClasses (_config/"actions");
	if (_actionList isEqualTo []) exitWith {
		["actions", _config] spawn EBA_fnc_keyHandler_system_throw;
	};

	//Check Action List
	{
		_action = _x;

		//Check Name
		_actionName = getText (_action/"name");
		if (_actionName isEqualTo "") exitWith {
			["name", _action] spawn EBA_fnc_keyHandler_system_throw;
		};

		//Check Tooltip
		_actionName = getText (_action/"tooltip");
		if (_actionName isEqualTo "") exitWith {
			["tooltip", _action] spawn EBA_fnc_keyHandler_system_throw;
		};

		//Check Script
		_defaultKeys = getArray (_action/"defaultKeys");
		if (_defaultKeys isEqualTo []) exitWith {
			["script", _config] spawn EBA_fnc_keyHandler_system_warn;
		};

		//Check Default Keys
		_defaultKeys = getArray (_action/"defaultKeys");
		if (_defaultKeys isEqualTo []) exitWith {
			["defaultKeys", _config] spawn EBA_fnc_keyHandler_system_warn;
		};
	} forEach _actionList;
} forEach _keysConfigs;

/*
	Press: ToDo
		When press simultenously, it fires?
		When one is held and the other one are pressed after, it fires?
		When both are held, then one is released and pressed again, it fires?
	Double: Done
		When double in lass than 0.5s? Yes.
		If we hold a key then rapidly press again, it should not count as doubled? Yes.
		If we press 3 time, only activates for one doulbe but when 4 time, for 2, etc.? Yes

	Hold: Done
		When hold, it fires continously? Yes
*/
EBA_fnc_processKeys = {
params ["_EBA_keyHandler_keysArray"];
_keysConfigs = configProperties [configFile >> "EBA_keysConfig_M", "true"];
{
	_config = _x;
	_addonName = configName _config;
	_actionList = "true" configClasses (_config/"actions");
	{
		_action = _x;
		_actionName = configName _action;
		_keyRegistery = format ["EBA_keyHandler_keyRegistery_%1_%2", _addonName, _actionName];
		//_keyRegistery = (profileNamespace getVariable _keyRegistery);
		_keyCombinaison = [([] call (compile _keyRegistery)), (getArray (_action/"defaultKeys"))] select (isNil _keyRegistery);
		_type = (getText (_action/"type"));
		_script = (getText (_action/"script"));
		{
			// SIMPLE KEY PRESS/HOLD //
			_keys = _x;
			_tempNum = 0;
			if ((count _keys) > 3) exitWith {
				systemChat format ["%1: Too much keys...", diag_tickTime];
			};
			{
				_key = _x;
				_nowPressed = _EBA_keyHandler_keysArray#_key#0#0;
				_nowDoubled = _EBA_keyHandler_keysArray#_key#0#1;
				_tempNum = [0, (_tempNum + 1)] select _nowPressed;
			} forEach _keys;
			[] call (compile (["", _script] select (_tempNum isEqualTo (count _keys))))
		} forEach _keyCombinaison;
	} forEach _actionList;
} forEach _keysConfigs;
};

[] spawn {
waitUntil {!isNull findDisplay 46};
_display = findDisplay 46;

EBA_keyHandler_keysArray = [];
for "_i" from 0 to 256 do {
	_now = [false, false, false, true, 0];
	_before = [false, false, false, true, 0];
	_last = [false, false, false, true, 0];
	_pushBack = [_now, _before, _last];
    EBA_keyHandler_keysArray pushBack _pushBack;
};

_display displayRemoveAllEventHandlers "KeyDown";
_display displayRemoveAllEventHandlers "KeyUp";

_display displayAddEventHandler ["KeyDown", {
	_key = (_this#1);
	if (_key > 255) exitWith {};

	_before = EBA_keyHandler_keysArray#_key#0;
	_before params ["_beforePressed", "_beforeDoubled", "_beforeHolded", "_beforeUp", "_beforeTime"]; //Alway after-UP

	_last = EBA_keyHandler_keysArray#_key#1;
	_last params ["_lastPressed", "_lastDoubled", "_lastHolded", "_lastUp", "_lastTime"];

	_nowPressed = true;
	_nowDoubled = (_nowPressed && _beforeUp && !_lastDoubled && !_lastHolded && ((diag_tickTime - _lastTime) < 0.5));
	_nowHolded = (_nowPressed && _lastPressed && !_beforeUp);
	_nowUp = false;
	_nowTime = diag_tickTime;

	_now = [_nowPressed, _nowDoubled, _nowHolded, _nowUp, _nowTime];
	EBA_keyHandler_keysArray set [_key, [_now, _before, _last]];

	[EBA_keyHandler_keysArray] call EBA_fnc_processKeys;
}];

_display displayAddEventHandler ["KeyUp", {
	_key = (_this#1);
	if (_key > 255) exitWith {};

	_before = EBA_keyHandler_keysArray#_key#0;
	_before params ["_beforePressed", "_beforeDoubled", "_beforeHolded", "_beforeUp", "_beforeTime"]; //Alway after-UP

	_last = EBA_keyHandler_keysArray#_key#1;
	_last params ["_lastPressed", "_lastDoubled", "_lastHolded", "_lastUp", "_lastTime"];

	_nowPressed = false;
	_nowDoubled = false;
	_nowHolded = false;
	_nowUp = true;
	_nowTime = diag_tickTime;

	_now = [_nowPressed, _nowDoubled, _nowHolded, _nowUp, _nowTime];
	EBA_keyHandler_keysArray set [_key, [_now, _before, _last]];
}];
};
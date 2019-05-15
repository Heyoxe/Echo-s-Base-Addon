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
	params ["_nowArray", "_beforeArray"];
	_keysConfigs = configProperties [configFile >> "EBA_keysConfig_M", "true"];
	{
		_config = _x;
		_actionList = "true" configClasses (_config/"actions");
		{
			_action = _x;
			_keyCombinaison = (getArray (_action/"defaultKeys"));
			_type = (getText (_action/"type"));
			_script = (getText (_action/"script"));
			{
				_keys = _x;
				switch _type do {
					case "HOLD": {
						_bool = 0;
						_target = (count _keys);
						{
							_key = _x;
							_now = _nowArray#_key;
							_isHolded = _now#2;
							_isUp = _now#3;
							if (_isHolded && !_isUp) then {
								_bool = _bool + 1;
							};						
						} forEach _keys;
						if (_bool isEqualTo _target) then {
							[] call (compile _script);
						};
					};
					default {};
					};
				};
			} forEach _keyCombinaison;
		} forEach _actionList;
	} forEach _keysConfigs;
};

[] spawn {
waitUntil {!isNull findDisplay 46};
_display = findDisplay 46;

EBA_keyHandler_keysArray = [];
for "_i" from 0 to 256 do {
	_now = [];
	_before = [];
	_lastState = [];
	_now pushBack [false, false, false, true, 0];
	_before pushBack [false, false, false, true, 0];
	_lastState pushBack [false, false, false, true, 0];
	_pushBack = [_now, _before, _lastState];
    EBA_keyHandler_keysArray pushBack [_pushBack];
};

_display displayRemoveAllEventHandlers "KeyDown";
_display displayRemoveAllEventHandlers "KeyUp";

_display displayAddEventHandler ["KeyDown", {
	_key = (_this#1);
	if (_key > 255) exitWith {};

	_before = EBA_keyHandler_keysArray#_key#2;
	_wasPressed = _before#0;
	_wasDoubled = _before#1;
	_wasHolded = _before#2;
	_wasUp = _before#3;
	_whenWasIt = _before#4;

	_isPressed = true;
	_isDoubled = [false, true] select (_isPressed && _wasUp && _wasPressed && !_wasHolded && !_wasDoubled && ((diag_tickTime - _whenWasIt) < 0.5));
	_isHolded = [false, true] select (_isPressed && _wasPressed && !_wasUp);
	_isUp = false;
	_whenIsThis = diag_tickTime;

	_now = [_isPressed, _isDoubled, _isHolded, _isUp, _whenIsThis];
	EBA_keyHandler_keysArray set [_key, [_now, _before]];
	if (_isPressed && !_isHolded && !_isDoubled) then {
		systemChat format ["%1: %2 is Pressed!", diag_tickTime, keyName _key, _isPressed];
	};
	if (_isDoubled) then {
		systemChat format ["%1: %2 is Doubled!", diag_tickTime, keyName _key, _isHolded];
	};
	if (_isHolded) then {
		systemChat format ["%1: %2 is Held!", diag_tickTime, keyName _key, _isHolded];
	};
}];

_display displayAddEventHandler ["KeyUp", {
	_key = (_this#1);
	if (_key > 255) exitWith {};
	_before = EBA_keyHandler_keysArray#_key#1;
	_isPressed = false;
	_isDoubled = false;
	_isHolded = false;
	_isUp = true;
	_whenIsThis = diag_tickTime;

	_now = [_isPressed, _isDoubled, _isHolded, _isUp, _whenIsThis];
	EBA_keyHandler_keysArray set [_key, [_now, _before]];
}];
};
params ["_keyDownArray", "_keyUpArray"];

_keysConfigs = configProperties [configFile >> "EBA_keysConfig_M", "true"];
_keyDownArray_before = EBA_keyHandler_keyDownArray_before;
{
    _config = _x;
    _actionList = "true" configClasses (_config/"actions");
    _addonName = configName _config;
    {
        _actionName = configName _x;
        if (isNil (format ["EBA_keyHandler_%1_%2_executed", _addonName, _actionName])) then {
            [] call (compile (format ["EBA_keyHandler_%1_%2_executed = false", _addonName, _actionName]));
        };
        _executed = [] call (compile (format ["EBA_keyHandler_%1_%2_executed", _addonName, _actionName]));
        _keyCombinaison = (getArray (_x/"defaultKeys"));
        _script = (getText (_x/"script"));
        {
            _key = _x;
            _mode = "PRESS";
            _boolNumb = 0;
            _targetBool = (count _key);
            if ((typeName (_key#0)) isEqualTo "STRING") then {
                _mode = (_key#0);
                _key = (_key#1);
            };
            switch _mode do {
                case "HOLD": {
                    if ((_keyDownArray#_key) > 1) then {
                        [] call (compile _script);
                    };
                };
                case "DOUBLE": {
                    if ((_keyUpArray#_key) > 1) then {
                        if ((diag_tickTime - (_keyUpArray#(_key + 256))) <= 0.5) then {
                            [] call (compile _script);
                        };
                    };
                };
                case "CONTINUOUS": {

                };
                default {
                    _released = false;
                    {
                        if ((_keyDownArray_before#_x) isEqualTo 0) then { //AND NONE OF THEY KEY HAS BEEN RELEASED
                                _boolNumb = _boolNumb + 1;
                        };
                    } forEach _key;
                    if !(_boolNumb isEqualTo 0) then {
                        _released = true;
                        [] call (compile (format ["EBA_keyHandler_%1_%2_executed = false", _addonName, _actionName]));
                    };
                    _boolNumb = 0;
                    {
                        if ((_keyDownArray#_x) > 0) then {
                            _boolNumb = _boolNumb + 1;
                        };
                    } forEach _key;
                    if ((_boolNumb isEqualTo _targetBool) && (!_executed && !_released)) then {
                        [] call (compile _script);
                        [] call (compile (format ["EBA_keyHandler_%1_%2_executed = true", _addonName, _actionName]));
                    };
                };
            };
        } forEach _keyCombinaison;
    } forEach _actionList;
} forEach _keysConfigs;
EBA_keyHandler_keyDownArray_before = EBA_keyHandler_keyDownArray;

/*
    TODO: Stop firing when pressed (works with just "F" or "RCTRL + A" but not with the Tri)
    TODO: Why on earth F can't be spammed? Forced to press another key before
    [PRESSED, DOUBLED, HOLDED, isUp, timestamp]
        PRESSED: if (_nowPressed && isUp && ((_nowTimestamp -timestemp) < 0.5)) then true;
        DOUBLED: if (_nowPressed) then true;
        HOLDED: if (PRESSED && _nowPressed) then true;
*/

					case "HOLD": {
						_now = (_nowArray#_x);
						_isHolded = _now#2;
						if (_isHolded) then {
							[] call (compile _script);
						};
					};
EBA_fnc_processKeys = {

};

waitUntil {!isNull findDisplay 46};
_display = findDisplay 46;

EBA_keyHandler_keysArray = []; 
for "_i" from 0 to 256 do {
    EBA_keyHandler_keysArray pushBack 0;
};

_display displayRemoveAllEventHandlers "KeyDown";
_display displayRemoveAllEventHandlers "KeyUp";

_display displayAddEventHandler ["KeyDown", {
	_key = (_this#1);
	if (_key > 255) exitWith {}; //Unrecognized key handling

    _before = (EBA_keyHandler_keysArray#_key);
    _wasPressed = _before#0;
    _wasDoubled = _before#1;
    _wasHolded = _before#2;
    _wasUp = _before#3;
    _whenWasIt = _before#4;

    _isPressed = true;
    _isDoubled = [true, false] select (_isPressed && _wasUp && ((diag_tickTime - _whenWasIt) < 0.5));
    _isHolded = [true, false] select (_isPressed && _wasPressed);
    _isUp = false;
    _whenIsThis = diag_tickTime;

    _howIsItNow = [_isPressed, _isDoubled, _isHolded, _isUp, _whenIsThis];
    EBA_keyHandler_keysArray set [_key, _howIsItNow];

    [] call EBA_fnc_processKeys;
}];

_display displayAddEventHandler ["KeyDown", {
	_key = (_this#1);
	if (_key > 255) exitWith {}; //Unrecognized key handling

    _isPressed = false;
    _isDoubled = false;
    _isHolded = false;
    _isUp = true;
    _whenIsThis = diag_tickTime;

    _howIsItNow = [_isPressed, _isDoubled, _isHolded, _isUp, _whenIsThis];
    EBA_keyHandler_keysArray set [_key, _howIsItNow];
}];
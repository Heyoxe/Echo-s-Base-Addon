[] spawn {
EBA_fnc_processKeys = {
	params ["_nowArray", "_beforeArray", "_beforeBeforeArray"];

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
							_before = _beforeArray#_key;
							_isHolded = _now#2;
							_wasHolded = _before#2;
							if (_isHolded) then {
								_bool = _bool + 1;
							};						
						} forEach _keys;
						if (_bool isEqualTo _target) then {
							[] call (compile _script);
						};
					};
					default {
						_mode = ["PRESS", "DOUBLE"] select ((count _keys > 1) && {(_keys#0) isEqualTo (_keys#1)});
						switch _mode do {
							case "DOUBLE": {
								_key = _keys#0;
								_now = _nowArray#_key;
								_before = _beforeArray#_key;
								_beforeBefore = _beforeBeforeArray#_key;
								_isDoubled = _now#1;
								_wasUp = _before#3;
								_wasDoubled_before = _beforeBefore#1;
								_wasHolded_before = _beforeBefore#2;
								if (_isDoubled && _wasUp && !_wasHolded_before && !_wasDoubled_before) then {
									systemChat str _beforeBefore;
									[] call (compile _script);
								};	
							};
							default {
								_temp = 0;
								{
									_key = _x;
									_now = _nowArray#_key;
									_before = _beforeArray#_key;
									_wasPressed = _before#0;
									if (!_wasPressed) then {
										_temp = _temp + 1;
									};
								} forEach _keys;
								_released = false;
								if (_temp isEqualTo 0) then {
									_released = false;
								} else {
									_released = true;
								};
								_bool = 0;
								_target = (count _keys);								
								{
									_key = _x;
									_now = _nowArray#_key;
									_before = _beforeArray#_key;
									_beforeBefore = _beforeBeforeArray#_key;
									_isPressed = _now#0;
									_wasPressed = _before#0;
									_wasPressedBefore = _beforeBefore#0;
									if (_isPressed) then {
										_bool = _bool + 1;
									};
								} forEach _keys;
								if (_bool isEqualTo _target) then {
									[] call (compile _script);
								};
							};
						};
					};
				};
			} forEach _keyCombinaison;
		} forEach _actionList;
	} forEach _keysConfigs;
};

waitUntil {!isNull findDisplay 46};
_display = findDisplay 46;

EBA_keyHandler_keysArray = []; 
EBA_keyHandler_keysArray_before = []; 
EBA_keyHandler_keysArray_beforeBefore = [];
for "_i" from 0 to 256 do {
    EBA_keyHandler_keysArray pushBack [false, false, false, true, 0];
	EBA_keyHandler_keysArray_before pushBack [false, false, false, true, 0];
	EBA_keyHandler_keysArray_beforeBefore pushBack [false, false, false, true, 0];
};

_display displayRemoveAllEventHandlers "KeyDown";
_display displayRemoveAllEventHandlers "KeyUp";

_display displayAddEventHandler ["KeyDown", {
	_key = (_this#1);
	if (_key > 255) exitWith {}; //Unrecognized key handling

    _before = EBA_keyHandler_keysArray#_key;
	_beforeBefore = EBA_keyHandler_keysArray_beforeBefore#_key; 
	
    _wasPressed = _before#0;
    _wasDoubled = _before#1;
    _wasHolded = _before#2;
    _wasUp = _before#3;
    _whenWasIt = _before#4;

	_wasDoubledBefore = _beforeBefore#1;

    _isPressed = true;
    _isDoubled = [false, true] select (_isPressed && _wasUp && !_wasDoubledBefore && ((diag_tickTime - _whenWasIt) < 0.5));
    _isHolded = [false, true] select (_isPressed && _wasPressed);
    _isUp = false;
    _whenIsThis = diag_tickTime;

    _now = [_isPressed, _isDoubled, _isHolded, _isUp, _whenIsThis];
	_beforeBefore = EBA_keyHandler_keysArray_before#_key;

    EBA_keyHandler_keysArray set [_key, _now];
	EBA_keyHandler_keysArray_before set [_key, _before];
	EBA_keyHandler_keysArray_beforeBefore set [_key, _beforeBefore];

    [EBA_keyHandler_keysArray, EBA_keyHandler_keysArray_before, EBA_keyHandler_keysArray_beforeBefore] call EBA_fnc_processKeys;
}];

_display displayAddEventHandler ["KeyUp", {
	_key = (_this#1);
	if (_key > 255) exitWith {}; //Unrecognized key handling

    _isPressed = false;
    _isDoubled = false;
    _isHolded = false;
    _isUp = true;
    _whenIsThis = diag_tickTime;

    _now = [_isPressed, _isDoubled, _isHolded, _isUp, _whenIsThis];
    EBA_keyHandler_keysArray set [_key, _now];
}];
};
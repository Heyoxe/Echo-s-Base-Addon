[] call EBA_fnc_configSafe;
[] call EBA_fnc_profileSafe;
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

_display displayAddEventHandler ["KeyDown", {
	_key = (_this#1);
	if (_key > 255) exitWith {};
	_before = EBA_keyHandler_keysArray#_key#0;
	_before params ["_beforePressed", "_beforeDoubled", "_beforeHolded", "_beforeUp", "_beforeTime"];

	_last = EBA_keyHandler_keysArray#_key#1;
	_last params ["_lastPressed", "_lastDoubled", "_lastHolded", "_lastUp", "_lastTime"];

	_nowPressed = true;
	_nowHolded = (_nowPressed && !_beforeUp);
	_nowDoubled = [(_nowPressed && _beforeUp && !_lastDoubled && !_lastHolded && ((diag_tickTime - _lastTime) < 0.5)), true] select (_beforeDoubled && _nowHolded);
	_nowUp = false;
	_nowTime = diag_tickTime;

	_now = [_nowPressed, _nowDoubled, _nowHolded, _nowUp, _nowTime];
	EBA_keyHandler_keysArray set [_key, [_now, _before, _last]];

	[EBA_keyHandler_keysArray] spawn EBA_fnc_processKeys;
}];

_display displayAddEventHandler ["KeyUp", {
	_key = (_this#1);
	if (_key > 255) exitWith {};
	_before = EBA_keyHandler_keysArray#_key#0;
	_last = EBA_keyHandler_keysArray#_key#1;

	_nowPressed = false;
	_nowDoubled = false;
	_nowHolded = false;
	_nowUp = true;
	_nowTime = diag_tickTime;

	_now = [_nowPressed, _nowDoubled, _nowHolded, _nowUp, _nowTime];
	EBA_keyHandler_keysArray set [_key, [_now, _before, _last]];
}];
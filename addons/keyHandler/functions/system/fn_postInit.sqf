EBA_keyHandler_keyDownArray = []; 
EBA_keyHandler_keyDownArray_before = [];
EBA_keyHandler_keyUpArray = []; 
for "_i" from 0 to 512 do {
    EBA_keyHandler_keyDownArray pushBack 0;
	EBA_keyHandler_keyDownArray_before pushBack 0;
    EBA_keyHandler_keyUpArray pushBack 0;
};

waitUntil {!isNull findDisplay 46};
_display = findDisplay 46;

_display displayAddEventHandler ["KeyDown", {
	_key = (_this#1);
	if (_key > 255) exitWith {}; //Unrecognized key handling
	_value = (EBA_keyHandler_keyDownArray#_key);
	EBA_keyHandler_keyDownArray set [_key, _value + 1];

	_value = (EBA_keyHandler_keyUpArray#_key);
	if (_value != 0) then {
		EBA_keyHandler_keyUpArray set [_key, _value + 1];
	};

	[EBA_keyHandler_keyDownArray, EBA_keyHandler_keyUpArray] call EBA_fnc_processKeys;
}];

_display displayAddEventHandler ["KeyUp", {
	_key = (_this#1);
	if (_key > 255) exitWith {}; //Unrecognized key handling
	_value = (EBA_keyHandler_keyDownArray#_key);
	EBA_keyHandler_keyDownArray set [_key, 0];

	_value = (EBA_keyHandler_keyUpArray#_key);
	if (_value isEqualTo 0) then {
		EBA_keyHandler_keyUpArray set [_key, _value + 1];
		EBA_keyHandler_keyUpArray set [(_key + 256), diag_tickTime];
	} else {
		EBA_keyHandler_keyUpArray set [_key,0];
	};
}];
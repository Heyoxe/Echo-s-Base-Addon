/*
    0: Up
    1: Pressed
    2:
    3:
    4:
    5: Holded

*/

//Array Init
keyDownArray = []; 
keyUpArray = []; 

for "_i" from 0 to 512 do {
    keyDownArray pushBack 0;
    keyUpArray pushBack 0;
};

//Process Keys
EBA_fnc_processKeys = {
    _keyDownArray = _this#0;
    _keyUpArray = _this#1;

    if ((_keyDownArray#2) < 2) then {
        if ((_keyDownArray#2) > 0) then {
            systemChat format ["%1: Key pressed...", diag_tickTime];
        };
    } else {
        systemChat format ["%1: Key holded...", diag_tickTime];
    };

    if ((_keyUpArray#2) > 1) then {
        if ((diag_tickTime - (keyUpArray#(2 + 256))) <= 0.4) then {
            systemChat format ["%1: Key doubled...", diag_tickTime];
        };
    };
};

[] spawn {
    _display = (findDisplay 46);
    _display displayRemoveAllEventHandlers "KeyDown";
    _display displayRemoveAllEventHandlers "KeyUp";
    waitUntil {!isNull _display};
    _display displayAddEventHandler ["KeyDown", {
        _key = (_this#1);
        _value = (keyDownArray#_key);
        keyDownArray set [_key, _value + 1];

        _value = (keyUpArray#_key);
        if (_value != 0) then {
            keyUpArray set [_key, _value + 1];
        };

        [keyDownArray, keyUpArray] call EBA_fnc_processKeys;
    }];

    _display displayAddEventHandler ["KeyUp", {
        _key = (_this#1);
        _value = (keyDownArray#_key);
        keyDownArray set [_key, 0];

        _value = (keyUpArray#_key);
        if (_value isEqualTo 0) then {
            keyUpArray set [_key, _value + 1];
            keyUpArray set [(_key + 256), diag_tickTime];
        } else {
            keyUpArray set [_key,0];
        };
    }];
};
[] spawn {
    while {true} do {
        hintSilent format ["%1, %2", (keyDownArray#2), (keyUpArray#2)]
    };
};
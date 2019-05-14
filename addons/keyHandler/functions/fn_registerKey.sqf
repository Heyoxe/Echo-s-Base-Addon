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

    _keysConfigs = configProperties [configFile >> "EBA_keysConfig_M", "true"];

    {
        _config = _x;
        _actionList = "true" configClasses (_config/"actions");
        {
            _keyCombinaison = (getArray (_x/"defaultKeys"));
            _script = (getText (_x/"script"));
            {
                _key = _x;
                _mode = "PRESS";
                _boolNumb = 0;
                _targetBool = 0;
                _targetBool = (count _key);
                if ((typeName (_key#0)) isEqualTo "STRING") then {
                    _mode = (_key#0);
                    _key = (_key#1);
                };
                switch (_mode) do {
                    case "HOLD": {
                        if ((_keyDownArray#_key) > 1) then {
                            [] call (compile _script);
                        };
                    };
                    case "DOUBLE": {
                        if ((_keyUpArray#_key) > 1) then {
                            if ((diag_tickTime - (keyUpArray#(_key + 256))) <= 0.5) then {
                                [] call (compile _script);
                            };
                        };
                    };
                    default {
                        {
                            if ((_keyDownArray#_x) < 2) then {
                                if ((_keyDownArray#_x) > 0) then {
                                    _boolNumb = _boolNumb + 1;
                                };
                            };
                        } forEach _key;
                        if (_boolNumb isEqualTo _targetBool) then {
                            [] call (compile _script);
                        };
                    };
                };
            } forEach _keyCombinaison;
        } forEach _actionList;
    } forEach _keysConfigs;
};

[] spawn {
    _display = (findDisplay 46);
    _display displayRemoveAllEventHandlers "KeyDown";
    _display displayRemoveAllEventHandlers "KeyUp";
    waitUntil {!isNull _display};
    _display displayAddEventHandler ["KeyDown", {
        _key = (_this#1);
        if (_key > 255) exitWith {systemChat format ["%1: Unrecognized key...", diag_tickTime]};
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
        if (_key > 255) exitWith {systemChat format ["%1: Unrecognized key...", diag_tickTime]};
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
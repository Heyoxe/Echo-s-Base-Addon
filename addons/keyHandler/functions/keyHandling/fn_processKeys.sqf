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
            switch (_mode) do {
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
                default {
                    _released = false;
                    {
                        if ((_keyDownArray_before#_x) isEqualTo 0) then { //AND NONE OF THEY KEY HAS BEEN RELEASED
                                _boolNumb = _boolNumb + 1;
                        };
                    } forEach _key;
                    if !(_boolNumb isEqualTo 0) then {
                        _released = true;
                    };
                    _boolNumb = 0;
                    {
                        if (_executed && !_released) then { //AND NONE OF THEY KEY HAS BEEN RELEASED
                            if ((_keyDownArray#_x) > 0) then {
                                _boolNumb = _boolNumb + 1;
                            };
                        };
                    } forEach _key;
                    systemChat format ["%1 --- %2", !_executed, _released];
                    if (_boolNumb isEqualTo _targetBool) then {
                        [] call (compile _script);
                        [] call (compile (format ["EBA_keyHandler_%1_%2_executed = true", _addonName, _actionName]));
                    };
                };
            };
        } forEach _keyCombinaison;
        hint str _forEachIndex;
    } forEach _actionList;
} forEach _keysConfigs;
EBA_keyHandler_keyDownArray_before = EBA_keyHandler_keyDownArray;
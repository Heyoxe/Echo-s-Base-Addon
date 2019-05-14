params ["_keyDownArray", "_keyUpArray"];

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
                        if ((diag_tickTime - (_keyUpArray#(_key + 256))) <= 0.5) then {
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
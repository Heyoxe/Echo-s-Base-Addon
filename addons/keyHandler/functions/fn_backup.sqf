[] spawn {
  waituntil {!isnull (finddisplay 46)};
  watchedCommands = []; //Todo: delete;
  lastKeyStroke = [[],[]]; //No global cuz EH
  (findDisplay 46) displayAddEventHandler ["KeyDown", {
    (lastKeyStroke#0) pushBack _this#1;
    (lastKeyStroke#1) pushBack diag_tickTime;
    if ((count (lastKeyStroke#0)) > 5) then { //Wtf am I doing?
      (lastKeyStroke#0) deleteAt 0;
      (lastKeyStroke#1) deleteAt 0;
    };
    {
      _tempBool = 0;
      _tempNumb = {(typeName _x) isEqualTo "SCALAR"} count _x;
      for "_i" from 0 to _tempNumb do {
        if (_x#_i in lastKeyStroke#0) then {
          _tempBool = _tempBool + 1;
        };
      };
      if (_tempBool isEqualTo _tempNumb) then {
        [] call (compile (_x#_tempNumb));
        /*
          (_x#0) call ESE_fnc_actionKeyRegistery;?????????????????? <-- Trouver un moyen pratique d'enregistrer/supprimer des keys avec leurs action respectives
        */
      };
    } forEach watchedCommands;
  }];
  while {true} do {
    {
      if ((diag_tickTime - _x) < 0.5) exitWith {};
      if ((diag_tickTime - _x) > 0.05) then {
        (lastKeyStroke#0) deleteAt _forEachIndex;
        (lastKeyStroke#1) deleteAt _forEachIndex;
      };
    } forEach (lastKeyStroke#1);
  };
};
[] spawn {
_display = (findDisplay 46);
_display displayRemoveAllEventHandlers "KeyDown";
waitUntil {!isNull _display};
lastKeyStroke = [[],[]];
_display displayAddEventHandler ["KeyDown", {
	(lastKeyStroke#0) pushBack _this#1;
    (lastKeyStroke#1) pushBack diag_tickTime;
	if ((count (lastKeyStroke#0)) > 10) then { //Wtf am I doing?
      (lastKeyStroke#0) deleteAt 0;
      (lastKeyStroke#1) deleteAt 0;
    };
}];
};

//if you press 2 (and even 3!) keys simultaneously, they will have the same "timestamp"
//Doulbe tap --> < 0.5sec
/*
[[29	,29		,29		,29		,29		,29		,29		,29		,1],
[7082.9	,7083.09,7085.74,7085.96,7090.41,7090.73,7092.94,7094.32,7095.13]]
7083.09 - 7082.9 = 0.189941
7085.96 - 7085.74 = 0.219727
7090.73 - 7090.41 = 0.319824
7094.32 - 7092.94 = 1.37988*/

/*
{
	_tempBool = 0;
	_tempNumb = {(typeName _x) isEqualTo "SCALAR"} count _x;
	for "_i" from 0 to _tempNumb do {
		if (_x#_i in lastKeyStroke#0) then {
			_tempBool = _tempBool + 1;
		};
	};
	if (_keysIn isEqualTo _requiredKeys) then {
		//Execute Action code to see how to implement
	};
} forEach watchedCommands;
*/
/*
_keysConfigs = configProperties [configFile >> "EBA_keysConfig_M", "true"];
{
	_config = _x;
	_actionList = "true" configClasses (_config/"actions");
	systemChat format ["========== %1 ==========", diag_tickTime];
	systemChat str (getText (_config/"name"));
	{
        _keys = getArray (_x/"defaultKeys");
        {
            _temp = _x;
            _tempKeys sort true; <
            _tempPressed = _pressedKeys;
            if (_temp in ) _this this 
        } forEach _keys;
		//systemChat format ["%1 (%2) --> %3", getText (_x/"name"), getText (_x/"tooltip"), getArray (_x/"defaultKeys")];
	} forEach _actionList;
} forEach _keysConfigs;

switch 

ON_KEY_PRESSED {
    {
        _timestamp = 0;
        {
            if (_keyCount => 2) then {
                {
                    _temp = [];
                    _temp pushBackUnique _x;
                } forEach %PRESSED_KEYS%#1;
                if !(_temp isEqualTo (count (%PRESSED_KEYS#1))) exitWith {};
            };
        } forEach %REGISTERED_KEY%;
    } forEach %REGISTERED_ACTIONS%;
};



1. 

Quand une touche est pressee,
    Pour chaque %ACTIONS%

    */
    ["apple","apple","pear","pear","apple"] call BIS_fnc_consolidateArray;

["KeyDown", {
    //For Single/Multi-Key Press
    if (isNil "##KEY_PRESSED##") then {
        ##KEY_PRESSED## = [[], []]
    };

    (##KEY_PRESSED## select 0) pushBack _this#1;
    (##KEY_PRESSED## select 1) pushBack diag_tickTime;
    {
        {
            if (##UNIQUE_TIMESTAMP_COUNT## isEqualTo ##PRESSED_KEY_TIMESTAMPS_COUNT##) exitWith {systemChat format ["%1: No multiple key pressed...", diag_tickTime]};
            if (##UNIQUE_TIMESTAMP_COUNT## < ##ACTIONS_KEY_COUNT##) exitWith {systemChat format ["%1: Not enough key pressed...", diag_tickTime]};
            //Faire les groups par Timestamps

            _boolNumb = 0;
            {
                if (_x in ##ACTIONS_KEY_GROUPS##) then {
                    _boolNumb = _boolNumb + 1;
                };
            } forEach ##ACTIONS_KEY_ARRAY_ELEMENT##; //"CTRL"
            if (_boolNumb isEqualTo ##ACTIONS_KEY_COUNT##) then {
                /*


                    Execute the script!
                

                */
            };
            //{_boolNumb isEqualTo ##ACTIONS_KEY_COUNT##} select [{/*         EXECUTE         */}, {systemChat format ["%1: Unable to validate key combinaison...", diag_tickTime]}]
        } forEach ##ACTIONS_KEY_ARRAY##; //["CTRL", "R"]
    } forEach ##ACTIONS##; //[["CTRL", "R"], ["DOUBLE", "R"]]

    //ToDo: Hold Key (> 0.5s)

    //ToDo: Double Tap (< 0.5s)
}]

["KeyDown", {
    _key = (_this#1);
    _value = (keyDownArray#_key);
    keyDownArray set [_key, _value + 1];

    _value = (keyUpArray#_key);
    if (_value != 0) then {
        keyUpArray set [_key, _value + 1];
    };

    [] call EBA_fnc_processKeys;
}];

["KeyUp", {
    _key = (_this#1);
    _value = (keyUpArray#_key);
    if (_value isEqualTo 0) then {
        keyUpArray set [_key, _value + 1];
    } else {
        keyUpArray set [_key, _value + 0];
    };
}];
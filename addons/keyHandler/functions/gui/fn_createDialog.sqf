params ["_mode", "_addonName", "_actionName"];

switch _mode do {
	case 1: {
		[_addonName, _actionName] spawn {
			params ["_addonName", "_actionName"];
			disableSerialization;
			_display = 0;
			if !(isNull (findDisplay 19943)) then {
				_display = findDisplay 19943;
				{ctrlDelete _x} forEach (allControls _display);
			} else {
				createDialog "EBAConfigure";
				_display = (findDisplay 19943);
			};

			_config = configFile >> "EBA_keysConfig_M" >> _addonName >> "actions" >> _actionName;
			_name = getText (_config/"name");
			_tooltip= getText (_config/"tooltip");

			_Vignette = _display ctrlCreate ["EBABackground", 2210];
			_Vignette ctrlSetPosition [safeZoneX, safeZoneY, safeZoneW, safeZoneH];
			_Vignette ctrlCommit 0;

			_MainBackground = _display ctrlCreate ["EBABackground", 2200];
			_MainBackground ctrlSetPosition [0.267969 * safezoneW + safezoneX, 0.269 * safezoneH + safezoneY, 0.464062 * safezoneW, 0.484 * safezoneH];
			_MainBackground ctrlCommit 0;

			_Title = _display ctrlCreate ["EBATitle", 2208];
			_Title ctrlSetPosition [0.267969 * safezoneW + safezoneX, 0.247 * safezoneH + safezoneY, 0.464062 * safezoneW, 0.022 * safezoneH];
			_Title ctrlSetText _name;
			_Title ctrlCommit 0;

			_Description = _display ctrlCreate ["RscText", 2215];
			_Description ctrlSetPosition [0.273125 * safezoneW + safezoneX, 0.28 * safezoneH + safezoneY, 0.45375 * safezoneW, 0.022 * safezoneH];
			_Description ctrlSetText _tooltip;
			_Description ctrlCommit 0;

			_AssignedKeys = _display ctrlCreate ["EBATitle", 2210];
			_AssignedKeys ctrlSetPosition [0.273125 * safezoneW + safezoneX, 0.313 * safezoneH + safezoneY, 0.309375 * safezoneW, 0.022 * safezoneH];
			_AssignedKeys ctrlSetText "Assigned Keys";
			_AssignedKeys ctrlCommit 0;

			_SpecialKeys = _display ctrlCreate ["EBATitle", 2212];
			_SpecialKeys ctrlSetPosition [0.587656 * safezoneW + safezoneX, 0.313 * safezoneH + safezoneY, 0.139219 * safezoneW, 0.022 * safezoneH];
			_SpecialKeys ctrlSetText "Special Keys";
			_SpecialKeys ctrlCommit 0;

			_KeyListBackground = _display ctrlCreate ["EBABackground", 2214];
			_KeyListBackground ctrlSetPosition [0.273125 * safezoneW + safezoneX, 0.335 * safezoneH + safezoneY, 0.309375 * safezoneW, 0.363 * safezoneH];
			_KeyListBackground ctrlCommit 0;

			_KeyList = _display ctrlCreate ["EBATable", 2214];
			_KeyList ctrlSetPosition [0.273125 * safezoneW + safezoneX, 0.335 * safezoneH + safezoneY, 0.309375 * safezoneW, 0.363 * safezoneH];
			_KeyList ctrlCommit 0;
			[_KeyList, _addonName, _actionName] call EBA_fnc_populateList;

			_SpecialKeysContainer = _display ctrlCreate ["RscListBox", 2213];
			_SpecialKeysContainer ctrlSetPosition [0.587656 * safezoneW + safezoneX, 0.335 * safezoneH + safezoneY, 0.139219 * safezoneW, 0.363 * safezoneH];
			_SpecialKeysContainer ctrlCommit 0;

			_Default = _display ctrlCreate ["RscButton", 2209];
			_Default ctrlSetPosition [0.273125 * safezoneW + safezoneX, 0.698 * safezoneH + safezoneY, 0.0773437 * safezoneW, 0.022 * safezoneH];
			_Default ctrlSetText "Default";
			_call = format ["[0, """", """"] call EBA_fnc_createDialog; [1, %1, %2] spawn EBA_fnc_defaultKeys", str _addonName, str _actionName];
			_Default ctrlSetEventHandler ["ButtonClick", _call];
			_Default ctrlCommit 0;

			_Delete = _display ctrlCreate ["RscButton", 2217];
			_Delete ctrlSetPosition [0.355625 * safezoneW + safezoneX, 0.698 * safezoneH + safezoneY, 0.0773437 * safezoneW, 0.022 * safezoneH];
			_Delete ctrlSetText "Delete";
			_call = format ["[%1, %2] call EBA_fnc_deleteKey", str _addonName, str _actionName];
			_Delete ctrlSetEventHandler ["ButtonClick", _call];
			_Delete ctrlCommit 0;

			_Cancel = _display ctrlCreate ["RscButton", 2205];
			_Cancel ctrlSetPosition [0.267969 * safezoneW + safezoneX, 0.731 * safezoneH + safezoneY, 0.0773437 * safezoneW, 0.022 * safezoneH];
			_Cancel ctrlSetText "Cancel";
			_Cancel ctrlSetEventHandler ["ButtonClick", "closeDialog 0; [0, """", """"] call EBA_fnc_createDialog"];
			_Cancel ctrlCommit 0;

			_Ok = _display ctrlCreate ["RscButton", 2207];
			_Ok ctrlSetPosition [0.654688 * safezoneW + safezoneX, 0.731 * safezoneH + safezoneY, 0.0773437 * safezoneW, 0.022 * safezoneH];
			_Ok ctrlSetText "Ok";
			_Ok ctrlSetEventHandler ["ButtonClick", "saveProfileNamespace; closeDialog 0; [0, """", """"] call EBA_fnc_createDialog"];
			_Ok ctrlCommit 0;

			(findDisplay 19943) setVariable ["EBA_KeyList", _KeyList];
		};
	};
	case 0: {
		[] spawn {
			disableSerialization;
			_display = 0;
			if !(isNull (findDisplay 19943)) then {
				_display = findDisplay 19943;
				{ctrlDelete _x} forEach (allControls _display);
			} else {
				createDialog "EBAConfigure";
				_display = (findDisplay 19943);
			};

			_Vignette = _display ctrlCreate ["EBABackground", 2210];
			_Vignette ctrlSetPosition [safeZoneX, safeZoneY, safeZoneW, safeZoneH];
			_Vignette ctrlCommit 0;

			_MainBackground = _display ctrlCreate ["EBABackground", 2200];
			_MainBackground ctrlSetPosition [0.267969 * safezoneW + safezoneX, 0.269 * safezoneH + safezoneY, 0.464062 * safezoneW, 0.484 * safezoneH];
			_MainBackground ctrlCommit 0;

			_Title = _display ctrlCreate ["EBATitle", 2208];
			_Title ctrlSetPosition [0.267969 * safezoneW + safezoneX, 0.247 * safezoneH + safezoneY, 0.464062 * safezoneW, 0.022 * safezoneH];
			_Title ctrlSetText "Configure";
			_Title ctrlCommit 0;

			_CategoryText = _display ctrlCreate ["RscText", 2215];
			_CategoryText ctrlSetPosition [0.273125 * safezoneW + safezoneX, 0.28 * safezoneH + safezoneY, 0.0515625 * safezoneW, 0.022 * safezoneH];
			_CategoryText ctrlSetText "Category: ";
			_CategoryText ctrlCommit 0;

			_Category = _display ctrlCreate ["RscCombo", 2201];
			_Category ctrlSetPosition [0.324687 * safezoneW + safezoneX, 0.28 * safezoneH + safezoneY, 0.257813 * safezoneW, 0.022 * safezoneH];
			_Category ctrlCommit 0;

			_Actions = _display ctrlCreate ["EBATitle", 2210];
			_Actions ctrlSetPosition [0.273125 * safezoneW + safezoneX, 0.313 * safezoneH + safezoneY, 0.154687 * safezoneW, 0.022 * safezoneH];
			_Actions ctrlSetText "Action";
			_Actions ctrlCommit 0;

			_AssignedKeys = _display ctrlCreate ["EBATitle", 2211];
			_AssignedKeys ctrlSetPosition [0.427812 * safezoneW + safezoneX, 0.313 * safezoneH + safezoneY, 0.154687 * safezoneW, 0.022 * safezoneH];
			_AssignedKeys ctrlSetText "Assigned Keys";
			_AssignedKeys ctrlCommit 0;

			_Informations = _display ctrlCreate ["EBATitle", 2212];
			_Informations ctrlSetPosition [0.587656 * safezoneW + safezoneX, 0.313 * safezoneH + safezoneY, 0.139219 * safezoneW, 0.022 * safezoneH];
			_Informations ctrlSetText "Informations";
			_Informations ctrlCommit 0;

			_KeyListBackground = _display ctrlCreate ["EBABackground", 2214];
			_KeyListBackground ctrlSetPosition [0.273125 * safezoneW + safezoneX, 0.335 * safezoneH + safezoneY, 0.309375 * safezoneW, 0.363 * safezoneH];
			_KeyListBackground ctrlCommit 0;

			_KeyList = _display ctrlCreate ["EBAControlsTable", 2214];
			_KeyList ctrlSetPosition [0.273125 * safezoneW + safezoneX, 0.335 * safezoneH + safezoneY, 0.309375 * safezoneW, 0.363 * safezoneH];
			_KeyList ctrlCommit 0;

			_InformationsContainer = _display ctrlCreate ["EBABackground", 2213];
			_InformationsContainer ctrlSetPosition [0.587656 * safezoneW + safezoneX, 0.335 * safezoneH + safezoneY, 0.139219 * safezoneW, 0.363 * safezoneH];
			_InformationsContainer ctrlCommit 0;

			_Cancel = _display ctrlCreate ["RscButton", 2205];
			_Cancel ctrlSetPosition [0.267969 * safezoneW + safezoneX, 0.731 * safezoneH + safezoneY, 0.0773437 * safezoneW, 0.022 * safezoneH];
			_Cancel ctrlSetText "Cancel";
			_Cancel ctrlSetEventHandler ["ButtonClick", "closeDialog 0"];
			_Cancel ctrlCommit 0;

			_Default = _display ctrlCreate ["RscButton", 2206];
			_Default ctrlSetPosition [0.350469 * safezoneW + safezoneX, 0.731 * safezoneH + safezoneY, 0.0773437 * safezoneW, 0.022 * safezoneH];
			_Default ctrlSetText "Default";
			_Default ctrlCommit 0;

			_Ok = _display ctrlCreate ["RscButton", 2207];
			_Ok ctrlSetPosition [0.654688 * safezoneW + safezoneX, 0.731 * safezoneH + safezoneY, 0.0773437 * safezoneW, 0.022 * safezoneH];
			_Ok ctrlSetText "Ok";
			_Ok ctrlSetEventHandler ["ButtonClick", "saveProfileNamespace; closeDialog 0"];
			_Ok ctrlCommit 0;

			(findDisplay 19943) setVariable ["EBA_KeyList", _KeyList];
			[_Category] call EBA_fnc_comboBox;
		};
	};
};
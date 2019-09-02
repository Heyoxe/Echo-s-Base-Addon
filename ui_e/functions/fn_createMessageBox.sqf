/*
	Author: Heyoxe
	Function: createMessageBox
	Description:
		Creates a message box wich requires action from the user.

	Parameters:
		0: "STRING" - Title of the dialog.
		1: "TEXT" - Message that will be showed in the body of the box.
		2: "ARRAY"
			option0text: "STRING" - Text showed on the button.
			option0code: "CODE" - Code that will be executed when the button is clicked.
		3: "ARRAY"
			option1text: "STRING" - Text showed on the button.
			option1code: "CODE" - Code that will be executed when the button is clicked.
		4 (OPTIONAL): "ARRAY"
			option2text: "STRING" - Text showed on the button .
			option2code: "CODE" - Code that will be executed when the button is clicked.

	Return: 
		BOOL: true if dialog successfuly created else false.


_title = "Are you sure?";
_body = parseText "Line 1.<br/>Line 2";
_option0 = ["Go Back", {systemChat "0"}];
_option1 = ["Yes", {systemChat "1"}];
_option2 = ["No", {systemChat "2"}];
[_title,_body,_option0,_option1] spawn EBA_fnc_createMessageBox;
 */
 
#include "..\IDXs.h"

params [
	["_titleString", nil, [""]],
	["_bodyText", nil, [(parseText "")]],
	["_option0params", nil, [[]], 2],
	["_option1params", nil, [[]], 2],
	["_option2params", nil, [[]], 2]
];

private _hasNils = ["_titleString", "_bodyText", "_option0params", "_option1params"] findIf {isNil _x};
if (_hasNils >= 0) exitWith {
	diag_log format ["%1 [Error] Invalid params passed to `EBA_fnc_createMessageBox`: %2.", diag_tickTime, _this];
	diag_log format ["%1 [Error] Excepted: [""STRING"", ""TEXT"", ""ARRAY[""STRING"", ""CODE""]"", ""ARRAY[""STRING"", ""CODE""]"", ""ARRAY[""STRING"", ""CODE""]""", diag_tickTime];
	false
};

createDialog "EBA_MessageBox";
private _display = findDisplay EBA_MESSAGEBOX_IDD;

private _title = _display displayCtrl EBA_MESSAGEBOX_TITLE_IDC;
_title ctrlSetText _titleString;

private _body = _display displayCtrl EBA_MESSAGEBOX_BODY_IDC;
_body ctrlSetStructuredText _bodyText;

if !(_option0params#0 isEqualTo "") then {
	private _option0 = _display displayCtrl EBA_MESSAGEBOX_OPTION0_IDC;
	private _code = format ["closeDialog 0; [] spawn %1", (_option0params#1)];
	_option0 ctrlSetText _option0params#0;
	_option0 ctrlSetEventHandler ["ButtonClick", _code];
	_option0 ctrlShow true;
	_option0 ctrlEnable true;
} else {
	diag_log format ["%1 [Warning] Option0 text was empty in `EBA_fnc_createMessageBox`: Button not showed but created.", diag_tickTime];
};

if !(_option0params#1 isEqualTo "") then {
	private _option1 = _display displayCtrl EBA_MESSAGEBOX_OPTION1_IDC;
	_code = format ["closeDialog 0; [] spawn %1", (_option1params#1)];
	_option1 ctrlSetText _option1params#0;
	_option1 ctrlSetEventHandler ["ButtonClick", _code];
	_option1 ctrlShow true;
	_option1 ctrlEnable true;
} else {
	diag_log format ["%1 [Warning] Option1 text was empty in `EBA_fnc_createMessageBox`: Button not showed but created.", diag_tickTime];
};

if (isNil "_option2params") exitWith {true};

if !(_option2params#0 isEqualTo "") then {
	private _option2 = _display displayCtrl EBA_MESSAGEBOX_OPTION2_IDC;
	_code = format ["closeDialog 0; [] spawn %1", (_option2params#1)];
	_option2 ctrlSetText _option2params#0;
	_option2 ctrlSetEventHandler ["ButtonClick", _code];
	_option2 ctrlShow true;
	_option2 ctrlEnable true;
} else {
	diag_log format ["%1 [Warning] Option2 text was empty in `EBA_fnc_createMessageBox`: Button not showed but created.", diag_tickTime];
};

true
params ["_addon", "_value", "_config"];
diag_log format ["[EBA::%1::ERROR] Empty or Undefined Class in %2/%3", _addon, _config, _value];
while {true} do {
	_text = format [
		"
		<t color=""#EA2027"" size=""3"" font=""RobotoCondensedBold"">EBA Encountered a Critical Error!</t>
		<br/>
		<t size=""1.5"" font=""RobotoCondensedBold"">System: <t color=""#F79F1F"">%1</t>.</t>
		<br/>
		<br/>
		Empty or Undefined Class in <t color=""#F79F1F"" font=""RobotoCondensedBold"">%2/%3</t>.
		<br/>
		<br/>
		Please Close the Game and make sure that your files are not corrupted.
		<br/>
		If the problem persist, please contant the Developper on Discord: <t color=""#3498db"" font=""RobotoCondensedBold"">https://discord.echoa3.io/</t>.
		",
		_addon,
		_config,
		_value
	];
	cutText [_text, "BLACK FADED", -1, true, true];
};
params ["_addon", "_config", "_value"];
diag_log format ["[EBA::%1::WARNING] Empty or Undefined Class in %2/%3", _addon, _config, _value];
systemChat format ["[EBA::%1::WARNING] Empty or Undefined Class in %2/%3", _addon, _config, _value];

params [
    ["_container", objNull]
];

if (_container isEqualTo objNull) exitWith {false};
if ([_container] call AUC_fnc_isStatic) exitWith {false}; // object is static
if !([_container] call AUC_fnc_isObject) exitWith {false};

if (_container canAdd "FirstAidKit") exitWith {true};

false;
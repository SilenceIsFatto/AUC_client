/*
    Author:
        Silence
    
    Description:
        Checks if provided argument is an object
    
    Params:
        _object <OBJECT>
    
    Usage:
        [cursorObject] call AUC_fnc_isObject;
    
    Return:
        true/false <BOOL>
*/

params ["_object"];

if (_object isEqualType objNull) then {_object = typeOf _object};
if (_object isKindOf "CAManBase") exitWith {false}; // object is player/unit
if (_object isKindOf "Logic") exitWith {false}; // object is logic/module
if (_object isKindOf "VirtualMan_F") exitWith {false}; // object is playable logic
if ([_object] call AUC_fnc_isVehicle) exitWith {false}; // object is vehicle

// Things we want to be "objects"
if (isClass (configFile >> 'CfgVehicles' >> _object)) exitWith {true};

false;
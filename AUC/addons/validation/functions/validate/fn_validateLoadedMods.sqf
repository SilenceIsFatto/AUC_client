/*
    Author:
        Silence
    
    Description:
        Checks if client has CfgPatches entries loaded from array
    
    Params:
        _forbiddenMods <ARRAY> <Default: AUC_forbiddenMods>
    
    Usage:
        call AUC_fnc_validateLoadedMods;
    
    Return:
        true/false <BOOL>
*/

params [
    ["_forbiddenMods", AUC_forbiddenMods]
];

["Validating loaded mods.", _fnc_scriptName] call AUC_fnc_log;

private _check = [_forbiddenMods] call A3U_fnc_hasAddon;

if (_check isEqualTo false) exitWith {false};

["Detected forbidden mods.", _fnc_scriptName] call AUC_fnc_log;
["kick_forbidden_mods", format["%1 has loaded some addons in the AUC_forbiddenMods variable.", (name player)]] call AUC_fnc_kickPlayer;

private _message = format["Kicking %1. They have loaded some forbidden addons.", (name player)];

[_message] call AUC_fnc_message;

true;
class CfgPatches {
    class EBA_Ui_E {
        name = "Echo's Base Addon - User Interfaces";
        author="Echo (Heyoxe)";
        url = "https://steamcommunity.com/id/Heyoxe/";
        requiredAddons[] = {
            "A3_Ui_F",
            "EBA_Functions_E",
            "EBA_Languages_E"
        };
        requiredVersion=0.1;
        units[]={};
        weapons[]={};
    };
};
#include "baseClass.h"
#include "dialogs\messageBox.h"
#include "CfgFunctions.h"
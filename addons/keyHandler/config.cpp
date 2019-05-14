class CfgPatches {
	class EBA_keyHandler {
		name="Echo's Base Addon - Key Handler";
		author="Heyoxe";
		url="https://steamcommunity.com/id/Heyoxe/";
		requiredAddons[]=
		{
			"A3_Ui_F"
		};
		requiredVersion=0.1;
		units[]={};
		weapons[]={};
	};
};

#include "\a3\ui_f\hpp\definedikcodes.inc"

class EBA_keysConfig_M {
    class ESE_keysConfig {
        name = "Echo's Sandbox Everywhere";
        tooltip = "Echo's mod bla bla bla";
        class actions {
            class openMenu {
                name = "Open Menu";
                tooltip = "Open ESE's Menu";
                script = "systemChat ""openMenu""";
                defaultKeys[] = {{DIK_RCONTROL, DIK_A}, {"HOLD", DIK_B}};
            };
            class openMenu2 {
                name = "Open Menu 2";
                tooltip = "Open ESE's Menu";
                script = "systemChat ""openMenu2""";
                defaultKeys[] = {{DIK_RCONTROL, DIK_RALT, DIK_C}, {DIK_D, DIK_E}};
            };
            class openMenu3 {
                name = "Open Menu 3";
                tooltip = "Open ESE's Menu";
                script = "systemChat ""openMenu3""";
                defaultKeys[] = {{DIK_F}, {"DOUBLE", DIK_G}};
            };
        };
    };
    /*
    class CBA_A3_keysConfig {
        name = "CBA A3";
        tooltip = "Community Base Addon";
        class actions {
            class nextRail {
                name = "Next Rail";
                tooltip = "Switch to the Next Rail";
                script = "";
                defaultKeys[] = {{"RIGHT CTRL", "E"}, {"HOLD", "H"}};
            };
            class PreviousRail {
                name = "Previous Rail";
                tooltip = "Switch to the Previous Rail";
                script = "";
                defaultKeys[] = {{"RIGHT CTRL", "RIGHT ALT", "R"}, {"R", "E"}};
            };
            class debugMode {
                name = "Open Debug";
                tooltip = "Open the Debug Console";
                script = "";
                defaultKeys[] = {{"E"}, {"DOUBLE", "H"}};
            };
        };
    };
    */
};
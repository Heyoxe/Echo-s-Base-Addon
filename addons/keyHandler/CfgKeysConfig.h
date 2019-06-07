#include "\a3\ui_f\hpp\definedikcodes.inc"

class EBA_keysConfig_M {
    class EBA_keysConfig {
        name = "Echo's Base Addon";
        tooltip = "Echo's mod bla bla bla";
        class actions {
            class openMenu {
                name = "Open Menu";
                tooltip = "Open ESE's Menu";
                script = "systemChat format [""%1: openMenu"", diag_tickTime]";
                defaultKeys[] = {{DIK_A}, {DIK_B, DIK_B}, {DIK_C, DIK_D}, {DIK_E, DIK_F, DIK_G}, {DIK_H, DIK_T, DIK_T}};
            };
            class openMenu2 {
                name = "Open Menu 2";
                tooltip = "Open ESE's Menu";
                script = "systemChat format [""%1: openMenu2"", diag_tickTime]";
                defaultKeys[] = {{DIK_K}, {DIK_L, DIK_L}, {DIK_M, DIK_N}, {DIK_O, DIK_P, DIK_Q}, {DIK_R, DIK_S, DIK_S}};
            };
            class openMenu3 {
                name = "Open Menu 3";
                tooltip = "Open ESE's Menu";
                script = "systemChat format [""%1: openMenu3"", diag_tickTime]";
                defaultKeys[] = {{DIK_LCONTROL, DIK_RSHIFT}};
            };
            class openMenu4 {
                name = "Open Menu 4";
                tooltip = "Open ESE's Menu";
                script = "systemChat format [""%1: openMenu4"", diag_tickTime]";
                defaultKeys[] = {{DIK_LCONTROL, DIK_LSHIFT}};
            };
            class openMenu5 {
                name = "Open Menu 5";
                tooltip = "Open ESE's Menu";
                script = "systemChat format [""%1: openMenu5"", diag_tickTime]";
                defaultKeys[] = {};
            };
        };
    };

    class CBA_A3_keysConfig {
        name = "CBA A3";
        tooltip = "Community Base Addon";
        class actions {
            class nextRail {
                name = "Next Rail";
                tooltip = "Switch to the Next Rail";
                script = "systemChat format [""%1: nextRail"", diag_tickTime]";
                defaultKeys[] = {};
            };
            class PreviousRail {
                name = "Previous Rail";
                tooltip = "Switch to the Previous Rail";
                script = "systemChat format [""%1: PreviousRail"", diag_tickTime]";
                defaultKeys[] = {};
            };
            class debugMode {
                name = "Open Debug";
                tooltip = "Open the Debug Console";
                script = "systemChat format [""%1: debugMode"", diag_tickTime]";
                defaultKeys[] = {};
            };
        };
    };
};
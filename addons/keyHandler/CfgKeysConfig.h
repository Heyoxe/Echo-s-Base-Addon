#include "\a3\ui_f\hpp\definedikcodes.inc"

class EBA_keysConfig_M {
    class EBA_keysConfig {
        name = "Echo's Base Addon";
        tooltip = "Echo's mod bla bla bla";
        class actions {
            class openMenu {
                name = "Open Menu";
                tooltip = "Open EBA's Menu";
                disable = true;
                script = "";
                defaultKeys[] = {{DIK_ESCAPE}};
            };
        };
    };
};
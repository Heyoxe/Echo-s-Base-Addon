#define PATH(addon, category) file = "\##addon##\functions\##category"

class CfgFunctions {
    class EBA {
        class system {
            PATH("keyHandler", "system");
            class postInit {
                postInit = 1;
            };
        };
        class system {
            PATH("keyHandler", "keyHandling");
            class processKeys {};
        };
    };
};
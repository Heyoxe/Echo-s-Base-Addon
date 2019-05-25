#include "functions_defines.h"
class CfgFunctions {
    class EBA {
        class system {
            CPATH(keyHandler,system);
            FUNC_POST(postInit);
        };
        class keyHandling {
            CPATH(keyHandler,keyHandling);
            FUNC_POST(processKeys);
            FUNC_POST(configSafe);
            FUNC_POST(profileSafe);
        };
    };
};

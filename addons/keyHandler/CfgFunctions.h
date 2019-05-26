#include "functions_defines.h"
class CfgFunctions {
    class EBA {
        class system {
            CPATH(keyHandler,system);
            FUNC_POST(postInit);
            FUNC(throw);
            FUNC(warn)
        };
        class keyHandling {
            CPATH(keyHandler,keyHandling);
            FUNC_POST(processKeys);
            FUNC(configSafe);
            FUNC(profileSafe);
        };
    };
};

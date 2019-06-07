#include "functions_defines.h"
class CfgFunctions {
    class EBA {
        class system {
            CPATH(keyHandler,system);
            FUNC_POST(postInit);
            //FUNC(throw);
            //FUNC(warn)
        };
        class keyHandling {
            CPATH(keyHandler,keyHandling);
            FUNC(processKeys);
            //FUNC(configSafe);
            //FUNC(profileSafe);
            FUNC(defaultKeys);
            FUNC(deleteKey);
            FUNC(addKey);
        };
        class GUI {
            CPATH(keyHandler,gui);
            FUNC(populateTable);
            FUNC(comboBox);
            FUNC(createDialog);
            FUNC(populateList);
        }
    };
};

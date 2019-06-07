#include "functions_defines.h"
class CfgFunctions {
    class EBA {
        class system {
            CPATH(keyHandler,system);
            FUNC_POST(postInit);
        };
        class keyHandling {
            CPATH(keyHandler,keyHandling);
            FUNC(processKeys);
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

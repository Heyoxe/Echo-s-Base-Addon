#define CPATH(addon,category) file = addon\functions\category
#define FUNC(name) class name {};

#define FUNC_START(name) \
    class name { \
        preStart = 1; \
    };
#define FUNC_PRE(name) \
    class name { \
        preInit = 1; \
    };
#define FUNC_POST(name) \
    class name { \
        postInit = 1; \
    };
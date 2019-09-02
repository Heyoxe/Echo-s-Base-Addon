#define CPATH(addon,category) file = addon\functions\category
#define PATH(addon) file = addon\functions
#define FUNC(name) class name {};

#define START(name) \
    class name { \
        preStart = 1; \
    };
#define PRE(name) \
    class name { \
        preInit = 1; \
    };
#define POST(name) \
    class name { \
        postInit = 1; \
    };
#define EBA_TOCOLOR(r,g,b,a) {r / 255, g / 255, b / 255, a}
#define EBA_COLOR_BACKGROUND {0, 0, 0, 0.5}
#define EBA_COLOR_TRANSPARENT {0, 0, 0, 0}
#define EBA_COLOR_MAIN EBA_TOCOLOR(58,145,219,1)
#define EBA_COLOR_WHITE {1, 1, 1, 1}
#define EBA_COLOR_BLACK {0, 0, 0, 1}
#define EBA_COLOR_DISABLED {0.5, 0.5, 0.5, 1}

#define EBA_POSITION(X,Y,W,H) \
    x = (X * safeZoneW) / 1920 + safeZoneX; \
    y = (Y * safeZoneH) / 1080 + safeZoneY; \
    w = (W * safeZoneW) / 1920; \
    h = (H * safeZoneH) / 1080;
	
#define EBA_POSITION_FROM(WIDTH,HEIGHT,X,Y,W,H) \
    x = (X * safeZoneW) / WIDTH + safeZoneX; \
    y = (Y * safeZoneH) / HEIGHT + safeZoneY; \
    w = (W * safeZoneW) / WIDTH; \
    h = (H * safeZoneH) / HEIGHT;

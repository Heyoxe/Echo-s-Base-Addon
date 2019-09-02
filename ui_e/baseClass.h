#include "macros.h"

class ScrollBar;

class EBA_CommonProperites {
    idc = -1;
    moving = false;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
    font = "RobotoCondensed";
    colorText[] = EBA_COLOR_WHITE;
    colorBorder[] = EBA_COLOR_TRANSPARENT;
    colorShadow[] = EBA_COLOR_TRANSPARENT;
    text = "";
    shadow = 0;
    tooltip = "";
    tooltipColorShade[] = EBA_COLOR_BACKGROUND;
    tooltipColorText[] = EBA_COLOR_WHITE;
    tooltipColorBox[] = EBA_COLOR_MAIN;
};

class EBA_MouseArea: EBA_CommonProperites {
    type = 0;
    style = 16;
    x = safeZoneX;
    y = safeZoneY;
    w = safeZoneW;
    h = safeZoneH;
    colorBackground[] = EBA_COLOR_TRANSPARENT;
    onMouseMoving = "";
    onMouseHolding = "";
    onMouseZChanged = "";
};

//Single-Line Text
class EBA_Text: EBA_CommonProperites {
    type = 0;
    style = 0;
    colorBackground[] = EBA_COLOR_TRANSPARENT;
};

class EBA_Text_Center: EBA_Text {
    style = 2;
};

class EBA_Text_Right: EBA_Text {
    style = 1;
};

class EBA_Text_Background: EBA_Text {
    colorBackground[] = EBA_COLOR_BACKGROUND;
};

class EBA_Text_Background_Center: EBA_Text_Background {
    style = 2;
};

class EBA_Text_Background_Right: EBA_Text_Background {
    style = 1;
};

//Multi-Line Text
class EBA_Text_Multi: EBA_Text {
    style = 16 + 0;
    lineSpacing = 1;
};

class EBA_Text_Multi_Center: EBA_Text_Multi {
    style = 16 + 2;
};

class EBA_Text_Multi_Right: EBA_Text_Multi {
    style = 16 + 1;
};

class EBA_Text_Multi_Background: EBA_Text_Multi {
    colorBackground[] = EBA_COLOR_BACKGROUND;
};

class EBA_Text_Multi_Background_Center: EBA_Text_Multi_Background {
    style = 16 + 2;
};

class EBA_Text_Multi_Background_Right: EBA_Text_Multi_Background {
    style = 16 + 1;
};

//Structured Text
class EBA_StructuredText: EBA_CommonProperites {
    type = 13;
    style = 0;
    size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
    colorBackground[] = EBA_COLOR_TRANSPARENT;      
};

class EBA_StructuredText_Background: EBA_StructuredText {
    colorBackground[] = EBA_COLOR_BACKGROUND;
};

//Picture
class EBA_Picture: EBA_CommonProperites {
    type = 0;
    style = 48;
    text = "#(argb,8,8,3)color(1,0,1,1)";
};

class EBA_PictureRatio: EBA_Picture {
	style = 48 + 2048;
};

class EBA_PictureTiles: EBA_Picture {
	style = 144;
};

//Button
class EBA_Button: EBA_CommonProperites {
    type = 1;
    style = 0;
    borderSize = 0;
    colorText[] = EBA_COLOR_WHITE;
    colorBackground[] = EBA_COLOR_BACKGROUND;
    colorBackgroundActive[] = EBA_COLOR_MAIN;
    colorBackgroundDisabled[] = EBA_COLOR_DISABLED;
    clorDisabled[] = EBA_COLOR_WHITE;
    colorFocused[] = EBA_COLOR_MAIN;
    offsetPressedX = 0;
    offsetPressedY = 0;
    offsetX = 0;
    offsetY = 0;
};

class EBA_Button_Center: EBA_Button {
    style = 2;
};

class EBA_Button_Right: EBA_Button {
    style = 1;
};

class EBA_ButtonPicture: EBA_Button {
    style = 48;
	text = "#(argb,8,8,3)color(0,0,1,1)";
};

class EBA_ButtonPictureNoBackground: EBA_ButtonPicture {
	colorBackground[] = EBA_COLOR_TRANSPARENT;
	colorFocused[] = EBA_COLOR_TRANSPARENT;
};

class EBA_ButtonPictureRatio: EBA_ButtonPicture {
	style = 48 + 2048;
};

class EBA_ButtonPictureRatioNoBackground: EBA_ButtonPictureRatio {
    colorBackground[] = EBA_COLOR_TRANSPARENT;
	colorFocused[] = EBA_COLOR_TRANSPARENT;
};

//Search
class EBA_Input: EBA_CommonProperites {
	type = 2;
	style = 0;
    autocomplete = "";
    colorBackground[] = EBA_COLOR_BLACK;
    colorSelection[] = EBA_COLOR_MAIN;
    colorDisabled[] = EBA_COLOR_DISABLED;
};

class EBA_Input_Multi: EBA_CommonProperites {
	type = 2;
	style = 16;
    autocomplete = "";
    colorBackground[] = EBA_COLOR_BLACK;
    colorSelection[] = EBA_COLOR_MAIN;
    colorDisabled[] = EBA_COLOR_DISABLED;
};

class EBA_Background: EBA_CommonProperites {
    type = 0;
    style = 128;
    colorBackground[] = EBA_COLOR_BACKGROUND;
};

class EBA_Title: EBA_CommonProperites {
    type = 0;
    style = 0;
    colorBackground[] = EBA_COLOR_MAIN;
};

class EBA_BackgroundStripes: EBA_PictureTiles {
    x = safeZoneX;
    y = safeZoneY;
    w = safeZoneW;
    h = safeZoneH;
    text = "\a3\3DEN\Data\Displays\Display3DENEditAttributes\backgroundDisable_ca.paa";
    tileW = "8 / (32 * pixelW)";
    tileH = "4 / (32 * pixelH)";
    colorText[] = {1,1,1,0.05};
};

class RscCombo;
class RscListBox;
class EBA_Combo: RscCombo {};
class EBA_ListBox: RscListBox {
	colorShadow[] = EBA_COLOR_TRANSPARENT;
	colorText[] = EBA_COLOR_WHITE;
	colorDisabled[] = EBA_COLOR_DISABLED;
	colorScrollbar[] = EBA_COLOR_MAIN;
	colorSelect[] = EBA_COLOR_WHITE;
	colorSelect2[] = EBA_COLOR_WHITE;
	colorSelectBackground[] = EBA_COLOR_MAIN;
	colorSelectBackground2[] = EBA_COLOR_MAIN;
	period = 0;
	colorBackground[] = EBA_COLOR_BACKGROUND;
	maxHistoryDelay = 1;
	colorPicture[] = EBA_COLOR_WHITE;
	colorPictureSelected[] = EBA_COLOR_WHITE;
	colorPictureDisabled[] = EBA_COLOR_DISABLED;
	colorPictureRight[] = EBA_COLOR_WHITE;
	colorPictureRightSelected[] = EBA_COLOR_WHITE;
	colorPictureRightDisabled[] = EBA_COLOR_DISABLED;
	colorTextRight[] = EBA_COLOR_WHITE;
	colorSelectRight[] = EBA_COLOR_WHITE;
	colorSelect2Right[] = EBA_COLOR_WHITE;
	tooltipColorText[] = EBA_COLOR_WHITE;
	tooltipColorBox[] = EBA_COLOR_BACKGROUND;
	tooltipColorShade[] = EBA_COLOR_MAIN;
	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
	class ListScrollBar: ScrollBar
	{
		color[] = EBA_COLOR_MAIN;
		autoScrollEnabled = 1;
	};
};
#include "..\macros.h"
#include "..\IDXs.h"

class EBA_MessageBox {
    idd = EBA_MESSAGEBOX_IDD;
    class ControlsBackground {
        class BackgroundDisabled: EBA_BackgroundStripes {};
    };

    class Controls {
        class Title: EBA_Title {
			idc = EBA_MESSAGEBOX_TITLE_IDC;
            EBA_POSITION(601,441,718,24)
        };
        class Body: EBA_StructuredText_Background {
			idc = EBA_MESSAGEBOX_BODY_IDC;
            EBA_POSITION(601,467,718,146)
        };
        class Option0: EBA_Button {
			idc = EBA_MESSAGEBOX_OPTION0_IDC;
            EBA_POSITION(601,615,178,24)
			onLoad = "(_this select 0) ctrlEnable false; (_this select 0) ctrlShow false";
        };
        class Option1: EBA_Button_Center {
			idc = EBA_MESSAGEBOX_OPTION1_IDC;
            EBA_POSITION(1141,615,178,24)
			onLoad = "(_this select 0) ctrlEnable false; (_this select 0) ctrlShow false";
        };
        class Option2: EBA_Button_Center {
			idc = EBA_MESSAGEBOX_OPTION2_IDC;
            EBA_POSITION(961,615,178,24)
			onLoad = "(_this select 0) ctrlEnable false; (_this select 0) ctrlShow false";
        };
    };
};


class ScrollBar;
class IGUIBack;
class RscText;
class RscCombo;
class RscButton;
class RscStructuredText;
class RscListBox;
class RscStandardDisplay;

/*
class EBATitle: RscText {
	colorBackground[] = {
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		1
	};
};
*/
class EBATitle: RscText {
	colorBackground[] = {0.1647,0.3725,0.6431,1};
};

class EBAStructuredText: RscText {
	h = 0.03 * safezoneH;
	style = 0;
	sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
};


class EBABackground: IGUIBack {
	colorBackground[] = {0, 0, 0, 0.6};
};

class EBATableButton: RscButton {
	h = 0.03 * safezoneH;
	colorBackground[]={0,0,0,0};
	colorBackgroundActive[]={0,0,0,0};
	colorFocused[]={0,0,0,0};
};

class EBAControlsTable 
{
    idc = 107;
	x = 0.273125 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.309375 * safezoneW;
	h = 0.385 * safezoneH;
     
    type = 19;
    style = 16;
	
    lineSpacing = 0;
    rowHeight = 0.03 * safezoneH;
    headerHeight = 0 * safezoneH;
     
    firstIDC = 42000;
    lastIDC = 44999;
    
	selectedRowColorFrom[] = {1, 1, 1, 0.8};
	selectedRowColorTo[] = {1, 1, 1, 0.8};
    selectedRowAnimLength = 0;
     
    class VScrollBar: ScrollBar
    {
        width = 0.022;
        autoScrollEnabled = 0;
        autoScrollDelay = 1;
        autoScrollRewind = 1;
        autoScrollSpeed = 1;
    };
 
    class HScrollBar: ScrollBar
    {
        height = 0;
    };

    class RowTemplate
    {
        class ColumnAction
        {
            controlBaseClassPath[] = {"EBAStructuredText"};
            columnX = 0;
            columnW = 0.1436875 * safezoneW;
            controlOffsetY = 0;
        };
        class ColumnKeys
        {
            controlBaseClassPath[] = {"EBAStructuredText"};
            columnX = 0.1436875 * safezoneW;
            columnW = 0.1436875 * safezoneW;
            controlOffsetY = 0;
        };
        class ColumnButton
        {
            controlBaseClassPath[] = {"EBATableButton"};
            columnX = 0;
            columnW = 0.309375 * safezoneW;
            controlOffsetY = 0;
        };
    };
	
    class HeaderTemplate {};	
};

class EBATable: RscListBox
{
    rowHeight = 0.03 * safezoneH;
};

class EBAControls: RscButton {
	x = 1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX);
	y = 1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
	w = 15 * (((safezoneW / safezoneH) min 1.2) / 40);
	h = 1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
	colorBackground[] = {0.1647,0.3725,0.6431,1};
	colorBackgroundActive[] = {0.1647,0.3725,0.6431,1};
	colorFocused[] = {0.1647,0.3725,0.6431,1};
	text = "Configure Echo's Controls"
	action = "ctrlActivate ((findDisplay 49) displayCtrl 2); [0, """"] call EBA_fnc_createDialog"
    font = "PuristaMedium";
    shadow = 0;
};

class EBAConfigure 
{
	idd = 19943;
	class Controls {};
};

class RscDisplayInterrupt: RscStandardDisplay {
	class EBAConfigure: EBAControls {};
}
/* #Jotexo
$[
	1.063,
	["ConfigureMain",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[2200,"MainBackground",[1,"",["0.267969 * safezoneW + safezoneX","0.269 * safezoneH + safezoneY","0.464062 * safezoneW","0.484 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2205,"Cancel",[1,"",["0.267969 * safezoneW + safezoneX","0.731 * safezoneH + safezoneY","0.0773437 * safezoneW","0.022 * safezoneH"],[0,0,1,1],[0,0,1,1],[0,0,1,1],"","-1"],[]],
	[2206,"Default",[1,"",["0.350469 * safezoneW + safezoneX","0.731 * safezoneH + safezoneY","0.0773437 * safezoneW","0.022 * safezoneH"],[0,0,1,1],[0,0,1,1],[0,0,1,1],"","-1"],[]],
	[2207,"Save",[1,"",["0.654688 * safezoneW + safezoneX","0.731 * safezoneH + safezoneY","0.0773437 * safezoneW","0.022 * safezoneH"],[0,0,1,1],[0,0,1,1],[0,0,1,1],"","-1"],[]],
	[2208,"Title",[1,"",["0.267969 * safezoneW + safezoneX","0.247 * safezoneH + safezoneY","0.464062 * safezoneW","0.022 * safezoneH"],[0,1,1,1],[0,1,1,1],[0,1,1,1],"","-1"],[]],
	[2210,"Actions",[1,"",["0.273125 * safezoneW + safezoneX","0.313 * safezoneH + safezoneY","0.154687 * safezoneW","0.022 * safezoneH"],[0,1,1,1],[0,1,1,1],[0,1,1,1],"","-1"],[]],
	[2211,"AssignedKeys",[1,"",["0.427812 * safezoneW + safezoneX","0.313 * safezoneH + safezoneY","0.154687 * safezoneW","0.022 * safezoneH"],[0,1,1,1],[0,1,1,1],[0,1,1,1],"","-1"],[]],
	[2212,"Informations",[1,"",["0.587656 * safezoneW + safezoneX","0.313 * safezoneH + safezoneY","0.139219 * safezoneW","0.022 * safezoneH"],[0,1,1,1],[0,1,1,1],[0,1,1,1],"","-1"],[]],
	[2213,"InformationsContainer",[1,"",["0.587656 * safezoneW + safezoneX","0.335 * safezoneH + safezoneY","0.139219 * safezoneW","0.363 * safezoneH"],[1,0,0,1],[1,0,0,1],[1,0,0,1],"","-1"],[]],
	[2214,"KeyList",[1,"",["0.273125 * safezoneW + safezoneX","0.335 * safezoneH + safezoneY","0.309375 * safezoneW","0.363 * safezoneH"],[1,0,0,1],[1,0,0,1],[1,0,0,1],"","-1"],[]],
	[2215,"CategoryText",[1,"",["0.273125 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.0515625 * safezoneW","0.022 * safezoneH"],[0,1,0,1],[0,1,0,1],[0,1,0,1],"","-1"],[]],
	[2201,"ComboBox",[1,"",["0.324687 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.257813 * safezoneW","0.022 * safezoneH"],[0,1,0,1],[0,1,0,1],[0,1,0,1],"","-1"],[]]
]
*/


/* #Mepeli
$[
	1.063,
	["ConfigureAction",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[2200,"MainBackground",[1,"",["0.267969 * safezoneW + safezoneX","0.269 * safezoneH + safezoneY","0.464062 * safezoneW","0.484 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2205,"Cancel",[1,"",["0.267969 * safezoneW + safezoneX","0.731 * safezoneH + safezoneY","0.0773437 * safezoneW","0.022 * safezoneH"],[0,0,1,1],[0,0,1,1],[0,0,1,1],"","-1"],[]],
	[2207,"Save",[1,"",["0.654688 * safezoneW + safezoneX","0.731 * safezoneH + safezoneY","0.0773437 * safezoneW","0.022 * safezoneH"],[0,0,1,1],[0,0,1,1],[0,0,1,1],"","-1"],[]],
	[2208,"Title",[1,"",["0.267969 * safezoneW + safezoneX","0.247 * safezoneH + safezoneY","0.464062 * safezoneW","0.022 * safezoneH"],[0,1,1,1],[0,1,1,1],[0,1,1,1],"","-1"],[]],
	[2210,"Actions",[1,"",["0.273125 * safezoneW + safezoneX","0.313 * safezoneH + safezoneY","0.309375 * safezoneW","0.022 * safezoneH"],[0,1,1,1],[0,1,1,1],[0,1,1,1],"","-1"],[]],
	[2212,"SpecialKeys",[1,"",["0.587656 * safezoneW + safezoneX","0.313 * safezoneH + safezoneY","0.139219 * safezoneW","0.022 * safezoneH"],[0,1,1,1],[0,1,1,1],[0,1,1,1],"","-1"],[]],
	[2213,"SpecialKeysContainer",[1,"",["0.587656 * safezoneW + safezoneX","0.335 * safezoneH + safezoneY","0.139219 * safezoneW","0.363 * safezoneH"],[1,0,0,1],[1,0,0,1],[1,0,0,1],"","-1"],[]],
	[2214,"KeyList",[1,"",["0.273125 * safezoneW + safezoneX","0.335 * safezoneH + safezoneY","0.309375 * safezoneW","0.363 * safezoneH"],[1,0,0,1],[1,0,0,1],[1,0,0,1],"","-1"],[]],
	[2215,"Description",[1,"",["0.273125 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.45375 * safezoneW","0.022 * safezoneH"],[0,1,0,1],[0,1,0,1],[0,1,0,1],"","-1"],[]],
	[2209,"Default",[1,"",["0.273125 * safezoneW + safezoneX","0.698 * safezoneH + safezoneY","0.0773437 * safezoneW","0.022 * safezoneH"],[0,0,1,1],[0,0,1,1],[0,0,1,1],"","-1"],[]],
	[2217,"Delete",[1,"",["0.355625 * safezoneW + safezoneX","0.698 * safezoneH + safezoneY","0.0773437 * safezoneW","0.022 * safezoneH"],[0,0,1,1],[0,0,1,1],[0,0,1,1],"","-1"],[]]
]
*/


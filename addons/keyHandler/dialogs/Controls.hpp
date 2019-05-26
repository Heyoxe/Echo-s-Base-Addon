class RscDisplayConfigure
{
	movingEnable=0;
	enableDisplay=1;
	scriptName="RscDisplayConfigure";
	scriptPath="GUI";
	onLoad="[""onLoad"",_this,""RscDisplayConfigure"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	onUnload="[""onUnload"",_this,""RscDisplayConfigure"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	class controlsBackground
	{
		class Vignette: RscVignette
		{
			idc=114998;
		};
		class TileGroup: RscControlsGroupNoScrollbars
		{
			idc=115099;
			x="safezoneXAbs";
			y="safezoneY";
			w="safezoneWAbs";
			h="safezoneH";
			class Controls
			{
				class Background: RscText
				{
					idc=114999;
					x=0;
					y=0;
					w="safezoneWAbs";
					h="safezoneH";
					colorBackground[]={0,0,0,0.5};
				};
			};
		};
		class BackgroundDisable: RscText
		{
		};
		class BackgroundDisableTiles: RscText
		{
		};
		class TitleBackground: RscText
		{
			colorBackground[]=
			{
				"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"
			};
			idc=1080;
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="38 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class MainBackground: RscText
		{
			colorBackground[]={0,0,0,0.69999999};
			idc=1081;
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="3.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="38 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="19.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class TabsBackground: RscText
		{
			colorBackground[]={0,0,0,1};
			idc=1082;
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="2.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="38 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
	class controls
	{
		class Title: RscTitle
		{
			style=0;
			idc=1000;
			text="$STR_DISP_OPTIONS_CONFIGURE";
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="13.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class PlayersName: Title
		{
			idc=109;
			style=1;
			colorBackground[]={0,0,0,0};
			x="15 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="24 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ButtonKeyboard: RscButtonMenu
		{
			idc=2400;
			text="$STR_A3_RscDisplayConfigure_ButtonKeyboard";
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="2.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class CA_ButtonCancel: RscButtonMenuCancel
		{
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="23 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="6.25 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class CA_ButtonContinue: RscButtonMenuOK
		{
			x="32.75 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="23 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="6.25 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class CA_ButtonDefault: RscButtonMenu
		{
			idc=101;
			shortcuts[]=
			{
				"0x00050000 + 2"
			};
			text="$STR_DISP_DEFAULT";
			x="7.35 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="23 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="6.25 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class KeyboardGroup: RscControlsGroup
		{
			class VScrollbar: VScrollbar
			{
				width=0;
			};
			class HScrollbar: HScrollbar
			{
				height=0;
			};
			idc=2300;
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="3.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="38 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="19.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			class controls
			{
				class EmptyText: RscText
				{
					idc=-1;
					x="0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y="0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class CA_ControlsPageText: RscText
				{
					sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
					style=1;
					idc=1002;
					text="$STR_DISP_CONF_SHOW";
					x="0.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w="4 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class CA_ControlsPage: RscCombo
				{
					idc=108;
					wholeHeight="12 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					x="4.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w="21 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class CA_ValueKeys: RscListBoxKeys
				{
					idc=102;
					mainCollumW=0.44999999;
					secndCollumW=0.55000001;
					x="0.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y="3.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w="25 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h="15.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class TextAction: RscText
				{
					idc=1003;
					text="$STR_A3_RscDisplayConfigure_TextAction";
					x="0.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y="2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w="11 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[]={0,0,0,1};
				};
				class TextAssignedKeys: RscText
				{
					idc=1004;
					text="$STR_A3_RscDisplayConfigure_TextAssignedKeys";
					x="11.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y="2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w="14 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[]={0,0,0,1};
				};
			};
		};
	};
};

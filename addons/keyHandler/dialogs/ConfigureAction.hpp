/* #Pokori
$[
	1.063,
	["GUIEditor",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,1],
	[-2210,"Background",[2,"",["-2.5 * GUI_GRID_W + GUI_GRID_X","2 * GUI_GRID_H + GUI_GRID_Y","45 * GUI_GRID_W","22 * GUI_GRID_H"],[0,1,1,0.5],[0,1,1,0.5],[0,1,1,0.5],"","-1"],[]],
	[2201,"DragAndDropKeys",[2,"",["28.5 * GUI_GRID_W + GUI_GRID_X","4 * GUI_GRID_H + GUI_GRID_Y","13.5 * GUI_GRID_W","14 * GUI_GRID_H"],[0,1,0,1],[0,1,0,1],[0,1,0,1],"","-1"],[]],
	[2206,"Confirm",[2,"",["34.5 * GUI_GRID_W + GUI_GRID_X","23 * GUI_GRID_H + GUI_GRID_Y","8 * GUI_GRID_W","1 * GUI_GRID_H"],[1,0,0,1],[1,0,0,1],[1,0,0,1],"","-1"],[]],
	[2207,"Title",[2,"",["-2.5 * GUI_GRID_W + GUI_GRID_X","1 * GUI_GRID_H + GUI_GRID_Y","45 * GUI_GRID_W","1 * GUI_GRID_H"],[1,0,0,1],[1,0,0,1],[1,0,0,1],"","-1"],[]],
	[2204,"Cancel",[2,"",["-2.5 * GUI_GRID_W + GUI_GRID_X","23 * GUI_GRID_H + GUI_GRID_Y","10 * GUI_GRID_W","1 * GUI_GRID_H"],[1,0,0,1],[1,0,0,1],[1,0,0,1],"","-1"],[]],
	[2209,"Next",[2,"",["20 * GUI_GRID_W + GUI_GRID_X","2.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1 * GUI_GRID_H"],[1,0,0,1],[1,0,0,1],[1,0,0,1],"","-1"],[]],
	[2211,"Action Name",[2,"",["6 * GUI_GRID_W + GUI_GRID_X","2.5 * GUI_GRID_H + GUI_GRID_Y","13.5 * GUI_GRID_W","1 * GUI_GRID_H"],[0,1,0,1],[0,1,0,1],[0,1,0,1],"","-1"],[]],
	[2200,"AssignedKeyList",[2,"",["-2 * GUI_GRID_W + GUI_GRID_X","4 * GUI_GRID_H + GUI_GRID_Y","30 * GUI_GRID_W","14 * GUI_GRID_H"],[0,1,0,1],[0,1,0,1],[0,1,0,1],"","-1"],[]],
	[2202,"Previous",[2,"",["-2 * GUI_GRID_W + GUI_GRID_X","2.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1 * GUI_GRID_H"],[1,0,0,1],[1,0,0,1],[1,0,0,1],"","-1"],[]],
	[2203,"Default",[2,"",["-2 * GUI_GRID_W + GUI_GRID_X","19 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1 * GUI_GRID_H"],[1,0,0,1],[1,0,0,1],[1,0,0,1],"","-1"],[]],
	[2208,"Delete",[2,"",["6 * GUI_GRID_W + GUI_GRID_X","19 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1 * GUI_GRID_H"],[1,0,0,1],[1,0,0,1],[1,0,0,1],"","-1"],[]],
	[2212,"Undo",[2,"",["14 * GUI_GRID_W + GUI_GRID_X","19 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1 * GUI_GRID_H"],[1,0,0,1],[1,0,0,1],[1,0,0,1],"","-1"],[]],
	[2205,"KeyInfo",[2,"",["-2 * GUI_GRID_W + GUI_GRID_X","20.5 * GUI_GRID_H + GUI_GRID_Y","44 * GUI_GRID_W","2 * GUI_GRID_H"],[0,1,0,1],[0,1,0,1],[0,1,0,1],"","-1"],[]]
]
*/
/*
class Background: IGUIBack
{
	idc = 2210;
	x = -2.5 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 45 * GUI_GRID_W;
	h = 22 * GUI_GRID_H;
	colorText[] = {0,1,1,0.5};
	colorBackground[] = {0,1,1,0.5};
	colorActive[] = {0,1,1,0.5};
};
class DragAndDropKeys: IGUIBack
{
	idc = 2201;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 13.5 * GUI_GRID_W;
	h = 14 * GUI_GRID_H;
	colorText[] = {0,1,0,1};
	colorBackground[] = {0,1,0,1};
	colorActive[] = {0,1,0,1};
};
class Confirm: IGUIBack
{
	idc = 2206;
	x = 34.5 * GUI_GRID_W + GUI_GRID_X;
	y = 23 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorText[] = {1,0,0,1};
	colorBackground[] = {1,0,0,1};
	colorActive[] = {1,0,0,1};
};
class Title: IGUIBack
{
	idc = 2207;
	x = -2.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1 * GUI_GRID_H + GUI_GRID_Y;
	w = 45 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorText[] = {1,0,0,1};
	colorBackground[] = {1,0,0,1};
	colorActive[] = {1,0,0,1};
};
class Cancel: IGUIBack
{
	idc = 2204;
	x = -2.5 * GUI_GRID_W + GUI_GRID_X;
	y = 23 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorText[] = {1,0,0,1};
	colorBackground[] = {1,0,0,1};
	colorActive[] = {1,0,0,1};
};
class Next: IGUIBack
{
	idc = 2209;
	x = 20 * GUI_GRID_W + GUI_GRID_X;
	y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorText[] = {1,0,0,1};
	colorBackground[] = {1,0,0,1};
	colorActive[] = {1,0,0,1};
};
class Action Name: IGUIBack
{
	idc = 2211;
	x = 6 * GUI_GRID_W + GUI_GRID_X;
	y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 13.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorText[] = {0,1,0,1};
	colorBackground[] = {0,1,0,1};
	colorActive[] = {0,1,0,1};
};
class AssignedKeyList: IGUIBack
{
	idc = 2200;
	x = -2 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 30 * GUI_GRID_W;
	h = 14 * GUI_GRID_H;
	colorText[] = {0,1,0,1};
	colorBackground[] = {0,1,0,1};
	colorActive[] = {0,1,0,1};
};
class Previous: IGUIBack
{
	idc = 2202;
	x = -2 * GUI_GRID_W + GUI_GRID_X;
	y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorText[] = {1,0,0,1};
	colorBackground[] = {1,0,0,1};
	colorActive[] = {1,0,0,1};
};
class Default: IGUIBack
{
	idc = 2203;
	x = -2 * GUI_GRID_W + GUI_GRID_X;
	y = 19 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorText[] = {1,0,0,1};
	colorBackground[] = {1,0,0,1};
	colorActive[] = {1,0,0,1};
};
class Delete: IGUIBack
{
	idc = 2208;
	x = 6 * GUI_GRID_W + GUI_GRID_X;
	y = 19 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorText[] = {1,0,0,1};
	colorBackground[] = {1,0,0,1};
	colorActive[] = {1,0,0,1};
};
class Undo: IGUIBack
{
	idc = 2212;
	x = 14 * GUI_GRID_W + GUI_GRID_X;
	y = 19 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorText[] = {1,0,0,1};
	colorBackground[] = {1,0,0,1};
	colorActive[] = {1,0,0,1};
};
class KeyInfo: IGUIBack
{
	idc = 2205;
	x = -2 * GUI_GRID_W + GUI_GRID_X;
	y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 44 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	colorText[] = {0,1,0,1};
	colorBackground[] = {0,1,0,1};
	colorActive[] = {0,1,0,1};
};
*/
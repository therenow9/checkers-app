/// @description move earl
event_inherited();
//get vars from parent
x-=1.5;
//make him move forward
if  (!place_meeting(x,y+vsp,obj_wall))
//if not touching the ground
//give earl gravity
{
	vsp+=10;
	//earl's gravity
}

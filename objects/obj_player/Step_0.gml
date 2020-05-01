/// @description plaer moving and stuff 

	//define inputs
	//input_left=keyboard_check(ord("A"))|| keyboard_check(vk_left);
	//input_right=keyboard_check(ord("D"))|| keyboard_check(vk_right);
	input_run=keyboard_check(vk_shift);
	input_jump=keyboard_check_pressed(vk_space);
	input_jump_held=keyboard_check(vk_space);
	input_slide=keyboard_check(ord("C"));
	
	//assuming we are moving upwards and not holding the jumpkey
			if (vsp<0) && (!input_jump_held) vsp=max(vsp,-jump_speed/3);
#region run stuff
if input_run
run=1.5
else
{
	run=1
}
walksp=4*run;//walk speed
#endregion

#region // calculate movement
//input-input prevents both from happening simultaneously
//var move_horizontal=input_right-input_left;

//movement
hsp=0;

vsp= (vsp+grv)//gravity ex falling

//jump if you are on the floor
can_jump-=1;
if(can_jump>0) && (input_jump)
{
	can_jump=0;
	//vsp=-8.5;
	vsp=-jump_speed;
}

#endregion
//Horizontal Collision 
if  (place_meeting(x+hsp,y,obj_wall))
{
	while(!place_meeting(x+sign(hsp),y,obj_wall))
	{
		x+=sign(hsp);
	}
	hsp=0;

}
x+=hsp


//Vertical Collision 
if  (place_meeting(x,y+vsp,obj_wall))
{
	while(!place_meeting(x,y+sign(vsp),obj_wall))
	{
		y+=sign(vsp);
	}
	vsp=0;

}
y+=vsp



if (!place_meeting(x,y+1,obj_wall))//if there isnt a collision one pixel below us
{
	sprite_index=spr_player_jump;
	image_speed=0;
	if (sign(vsp)>0) image_index=1; else image_index=0;
	
}
else//if we are touching the floor
{
	can_jump=10;
	if(sprite_index==spr_player_jump)  
	//while in the air
	{
		audio_sound_pitch(snd_landing,choose(0.8,1.0,1.2));
		audio_play_sound(snd_landing,4,false)
		repeat (5)
		{
			vsp=0;
		}
	}
	image_speed=1;
	if(input_slide)
	//slide key
	{
		sprite_index=spr_player_slide;	
		//change player sprite index
	}
	else if (!input_slide)//running
	{
		sprite_index=spr_player_running;
	}
}


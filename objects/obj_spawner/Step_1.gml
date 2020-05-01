/// @description spawn player
#region create ground beneath my feet
if (grnd.x<grnd.xstart-obj_ground.sprite_width+4){
inc+=1;
//speed up initial movement time
grnd=instance_create_layer(1025,605,"Instances",obj_ground);
//get ground moving and spawned in
}

if (inc>15)
//if enough ground has already been created
{
	room_speed=60;
	//set room speed back to normal
	if (!instance_exists(obj_player))
	{
		obj_game.time=0;
		//reset clock
		instance_create_layer(490,422,"inst_player",obj_player);
		//create player and stuff
		instance_create_layer(950,475,"inst_enemies",obj_earl);	
			//temp get earl working
	}
}
#endregion 
//work on spawingin enimies and what not


if (instance_exists(obj_player))
{
	rand=choose(1,2,3,4);

	switch (rand){
		case 1:
		instance_create_layer(490,900,"inst_enemies",obj_earl);
		case 2:
	
	}
}
/// @description Moving

//Getting directional input
move = keyboard_check(vk_right) - keyboard_check(vk_left);

//Moving the player
hsp += walkSpeed * move;
hsp -= sign(hsp); //Lowering speed

//Max speed
if (hsp > 12){hsp = 12;} else if (hsp < -12){hsp = -12;}

 //I DONT KNOW FOR SOME REASON I ADDED THIS AND I FORGOT ABOUT IT BUT REMOVING IT BREAKS EVERYTHING NOW LIKE ????
if (move != 0){thing = move;}

vsp += grv; //Gravitational acceleration

//Wall jump HOLY FUCKING SHIT THIS ACTUALLY WORKS
if (place_meeting(x+thing,y,oWall)) && (!place_meeting(x, y+1, oWall)){
	hsp = 0;
	move = 0;
	if (keyboard_check_pressed(ord("A"))){
		vsp = -12;
		hsp -= 15 * thing;
		thing = -sign(thing);
	}
}
	
//Jump
if (place_meeting(x, y+1, oWall)) && (keyboard_check_pressed(ord("A"))){
	vsp -= 8;
}
	
//Collisions
if (place_meeting(x+hsp, y, oWall)){
	
	while (!place_meeting(x+sign(hsp), y, oWall)){
		x += sign(hsp);
	}
	hsp = 0;
}
if (place_meeting(x, y+vsp, oWall)){
	
	while (!place_meeting(x, y+sign(vsp), oWall)){
		y += sign(vsp);
	}
	vsp = 0;
}
if (place_meeting(x+hsp, y+vsp, oWall)){
	hsp = 0;
	vsp = 0;
}

//Modifying X and Y values
x += hsp;
y += vsp;
// If the player isnt in a cutscene and you cant pause, follow the player
if (obj_player.can_move and global.can_pause){
	walk = obj_player.spd;
	dir = point_direction(x,y,obj_player.x,obj_player.y);
	
	// keep kat 25 units away from the player and have her approach at the player's speed
	if (x <= obj_player.x - 25 or x >= obj_player.x + 25){
		x = approach(x, obj_player.x, walk);
		y = approach(y, obj_player.y, walk);	
		
		// prevent clipping through walls
		if (place_meeting(x+walk,y,obj_wall)){
			x -= walk;
		}
		if (place_meeting(x-walk,y,obj_wall)){
			x += walk;
		}
		if (place_meeting(x,y+walk,obj_wall)){
			y -= walk;
		}
		if (place_meeting(x,y-walk,obj_wall)){
			y += walk;
		}
		
		// copy the player's image index
		image_index = obj_player.image_index;
		
		walking1 = true;
	}  else { walking1 = false; }
	// one of these if statements is for the x variable and the other is for the y
	if (y <= obj_player.y - 25 or y >= obj_player.y + 25){
		x = approach(x, obj_player.x, walk);
		y = approach(y, obj_player.y, walk);	
		
		if (place_meeting(x,y+walk,obj_wall)){
			y -= walk;
		}
		if (place_meeting(x,y-walk,obj_wall)){
			y += walk;
		}
		if (place_meeting(x+walk,y,obj_wall)){
			x -= walk;
		}
		if (place_meeting(x-walk,y,obj_wall)){
			x += walk;
		}
		
		image_index = obj_player.image_index;
		
		walking2 = true;
	} else { walking2 = false; }
	
	// if kat isnt walking at all then just stop the animation
	if (walking1 = false and walking2 = false){
		image_index = 0;
	}

	// If you are walking, replicate the player's sprite
	if (walking1 = true or walking2 = true){
		if (obj_player.sprite_index = spr_player_walk_coat){
			sprite_index = spr_kat_walk;
		}
		else if (obj_player.sprite_index = spr_player_upwalk_coat){
			sprite_index = spr_kat_upwalk;
		}
		else if (obj_player.sprite_index = spr_player_leftwalk_coat){
			sprite_index = spr_kat_leftwalk;
		}
		else if (obj_player.sprite_index = spr_player_rightwalk_coat){
			sprite_index = spr_kat_rightwalk;
		}
	}
}




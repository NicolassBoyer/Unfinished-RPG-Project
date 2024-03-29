	// Set portrait for the textbox
if (instance_exists(obj_textbox)){
	if (portrait != noone){
		obj_textbox.portrait_index = obj_kat.portrait_index;
		obj_textbox.portrait = obj_kat.portrait;
	}
}

	// play wind sfx in this room if it is not already playing
if (!audio_is_playing(snd_wind)){
	audio_play_sound(snd_wind, 5, false);
}

	// Switch statement for cutscene progression
switch (cut_prog){
	case 0:
	with (obj_player){
		state = state_cutscene;
	}
	// If the player y isnt at 157 move them and kat until a certain point
		if(obj_player.y != 157){
			obj_player.y++;
			obj_kat.y++;
		}
	// At that point, progress the cutscene
		if (obj_player.y = 157) cut_prog++;
	break;
	case 1:
	// Create a textbox if one doesn't exist
		if (!instance_exists(obj_textbox)){
			obj_kat.portrait_index = 0;
			create_textbox(text, speakers, next_line, scripts);
		}
	break;
	case 2:

	// Start timer
	if (run_once){
		time_source_start(staff_pull);
		run_once = false;
	}
	if (staff_anim){
	with (obj_kat){
	// When timer is done, change sprite and play sfx
				if (sprite_index != spr_kat_staff_pull and sprite_index != spr_kat_stafffall){
					audio_play_sound(snd_fling2, 10, false);
					image_index = 0;
					sprite_index = spr_kat_staff_pull;
				}
	// When animation is done, change the sprite and continue cutscene
				else if (sprite_index = spr_kat_staff_pull and image_index = 8){
					sprite_index = spr_kat_stafffall;
					obj_ev_falling_down.run_once = true;
					obj_ev_falling_down.cut_prog++;
				}
			}
	}
	
	break;
	case 3:
	// Katarina tells the player to move closer to her after a delay
	if (run_once){
		time_source_start(approach_textbox);
		run_once = false;
	}
	break;
	case 4:
	// Move the player closer to Katarina
	with(obj_player){
	// If the player's x isnt 120 keep moving them to the right
		if (x != 120){
			x -= 1;
			obj_kat.x += 1;
		} else {
	// If kat's sprite hasnt changed, switch to first frame of sprite
			if (obj_kat.sprite_index != spr_kat_staffbubble){
				obj_kat.image_index = 0;
			}
	// Then change the sprite and play sfx, then continue cutscene
			obj_kat.sprite_index = spr_kat_staffbubble;
			if (!audio_is_playing(snd_magicup)){
				audio_play_sound(snd_magicup, 1, false);
			}
			obj_ev_falling_down.cut_prog++;
		}
	}
	break;
	case 5:
	// play idle animation once the bubble animation is completed
	with (obj_kat){
		if (sprite_index = spr_kat_staffbubble and image_index = 6){
			sprite_index = spr_kat_staffbubble_idle;
		}
	}
	// If there is no bubble object, create one
	if (!instance_exists(obj_bubble)){
		instance_create_layer(95, 199, "Instances", obj_bubble);
	} else {
	// Otherwise, once the bubble finishes growing, freeze the sprite anim
		if (obj_bubble.image_index = 4){
			obj_bubble.image_speed = 0;
	// Have a timesource for a delay before continuing
			cut_prog_finish = time_source_create(time_source_game, 120, time_source_units_frames, function(){
			if (cut_prog = 5){
				cut_prog++;
			}
			}, [], 1);
			time_source_start(cut_prog_finish);
		}
	}
	break;
	case 6:
	{
		// End the cutscene and change rooms
		obj_game.spawn_x = 224;
		obj_game.spawn_y = 2;
		obj_game.spawn_room = rm_mine_entrance;
		obj_game.do_transition = true;
	}
}

if (cut_prog > 0){
	// float animation
	// float downwards until the speed hits 1, then reset the speed
	drop_speed += 1/60;
	if (drop_speed > 1) drop_speed -= 1;
	
	// initialize animation curve
	position = animcurve_channel_evaluate(curve,drop_speed);
	
	// Start and end points for variables
	var _startplayer = 157;
	var _endplayer = 187;
	var _distanceplayer = _endplayer - _startplayer;
	
	var _startkat = 157;
	var _endkat = 187;
	var _distancekat = _endkat - _startkat;
	
	var _startbubble = 199;
	var _endbubble = 209;
	var _distancebubble = _endbubble - _startbubble;
	
	// add animation curve amount to y variables
	obj_player.y = _startplayer + (_distanceplayer * position);
	obj_kat.y = _startkat + (_distancekat * position);
	
	// make the bubble float if it exists and has an img index of 4
	if (instance_exists(obj_bubble) and obj_bubble.image_index = 4){
		obj_bubble.y = _startbubble + (_distancebubble * position);
	}
}
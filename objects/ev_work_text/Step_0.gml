if (deactivatePlayer = true){
	if (instance_exists(obj_player)){
		instance_deactivate_object(obj_player);
		deactivatePlayer = false;
	}
}

if (katBox = true and !instance_exists(obj_textbox)){
	voice = snd_meow;
	name = "Katarina";
	global.name_text_col = c_gray;
	create_facetextbox(kattext, katspeakers, katnext_line, katscripts);
	obj_textbox.portrait_index = 7;
	obj_textbox.portrait = spr_kat_faces;
	katBox = false;
}

if (goToPark = true){
	instance_activate_object(obj_player);
	obj_game.spawnX = 237;
	obj_game.spawnY = 30;
	obj_game.spawnRoom = rm_park_crater;
	obj_game.doTransition = true;
}
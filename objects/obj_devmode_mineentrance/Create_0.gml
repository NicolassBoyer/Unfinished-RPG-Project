global.player_name = "Nick";
room_goto(rm_mine_entrance);
instance_destroy(obj_ev_mine_entrance);
//instance_create_layer(2, 224, "Instances", obj_bubble);
instance_create_layer(115, 224, "Instances", obj_player);
//obj_player.sprite_index = spr_player_falling_coat_left;
instance_create_layer(115, 224, "Instances", obj_kat);
//obj_kat.x = 160;
//obj_kat.y = 2;
//obj_bubble.image_index = 4;
//obj_bubble.image_speed = 0;
//obj_bubble.x = 191;
//obj_bubble.y = 30;
//obj_kat.sprite_index = spr_kat_fall;
//global.can_pause = false;
//obj_player.can_move = false;

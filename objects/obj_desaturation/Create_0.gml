/// @description Init
event_inherited();

//title_text = string_hash_to_newline("Simple Alpha");
//info_text = string_hash_to_newline("Simple Alpha:##Shader that changed the alpha of a sprite or surface. Pretty much useless since that can be done with with draw_sprite ext; ##1: -#2: -#3: -");

// sprites:
sprite_1 = spr_box_noborder;

// shader:
shader = shd_desaturation;
u_strength = shader_get_uniform(shader, "strength");


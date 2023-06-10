// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function input_handler(){
	#region PAUSING

// handle pausing
if (keyboard_check_pressed(global.key_esc) or gamepad_button_check_pressed(0,global.gp_esc)){
	if(room != rm_title_screen){
		if (!instance_exists(obj_textbox) and global.canPause == true and !instance_exists(obj_name_creator)){
			global.pause = true;
		}
	}
}
if (global.pause == true){
	instance_deactivate_layer("Instances");
}
if (global.pause == false){
	instance_activate_layer("Instances");
}
if (global.doTransition){
	global.canPause = false;
}
/*
if (global.pause == false and global.canPause == true and !instance_exists(obj_textbox)){
	if (global.hasBackpack){
		if (global.PINV and !global.inventoryOpen){
			global.inventoryOpen = true;
			audio_play_sound(global.s_select, 5, false);
		} 
	}
}
*/
#endregion

if (instance_exists(obj_player)){
	global.targetX = obj_player.x;
	global.targetY = obj_player.y;
}



#region ACTIVATE DEVMODE PRIVILEGES
if (instance_exists(obj_devmode)){
	global.hasBackpack = true;
	global.hasCoat = true;
}
#endregion

#region PLAYER INPUT

//HELD
var h_move = gamepad_axis_value(global.pad_num, gp_axislh);
var v_move = gamepad_axis_value(global.pad_num, gp_axislv);

if (keyboard_check(global.key_right) or gamepad_button_check(0,global.gp_right)
	or h_move > 0){
	global.HR = true;
}
else global.HR = false;

if (keyboard_check(global.key_left) or gamepad_button_check(0,global.gp_left)
	or h_move < 0){ 
	global.HL = true;
}
else global.HL = false;

if (keyboard_check(global.key_up) or gamepad_button_check(0,global.gp_up)
	or v_move < 0){
	global.HU = true;
}
else global.HU = false;

if (keyboard_check(global.key_down) or gamepad_button_check(0,global.gp_down)
	or v_move > 0){
	global.HD = true;
}
else global.HD = false;

if (keyboard_check(global.key_revert) or gamepad_button_check(0,global.gp_shoulderR) or gamepad_button_check(0,global.gp_shoulderL)) global.HRUN = true;
else global.HRUN = false;

//RELEASED
if (keyboard_check_released(global.key_right) or gamepad_button_check_released(0,global.gp_right)) global.RR = true;
else global.RR = false;

if (keyboard_check_released(global.key_left) or gamepad_button_check_released(0,global.gp_left)) global.RL = true;
else global.RL = false;

if (keyboard_check_released(global.key_up) or gamepad_button_check_released(0,global.gp_up)) global.RU = true;
else global.RU = false;

if (keyboard_check_released(global.key_down) or gamepad_button_check_released(0,global.gp_down)) global.RD = true;
else global.RD = false;

//PRESSED
if (keyboard_check_pressed(global.key_right) or gamepad_button_check_pressed(0,global.gp_right)){
	global.PR = true;
}
else global.PR = false;

if (keyboard_check_pressed(global.key_left) or gamepad_button_check_pressed(0,global.gp_left)){
	global.PL = true;
}
else global.PL = false;

if (keyboard_check_pressed(global.key_up) or gamepad_button_check_pressed(0,global.gp_up)){
	global.PU = true;
}
else global.PU = false;

if (keyboard_check_pressed(global.key_down) or gamepad_button_check_pressed(0,global.gp_down)){
	global.PD = true;
}
else global.PD = false;

if (keyboard_check_pressed(global.key_enter) or keyboard_check_pressed(global.key_confirm) or
	gamepad_button_check_pressed(0,global.gp_enter) or gamepad_button_check_pressed(0,global.gp_confirm))
global.POK = true;
else global.POK = false;

if (keyboard_check_pressed(global.key_revert) or keyboard_check_pressed(global.key_del) or
gamepad_button_check_pressed(0,global.gp_revert) or gamepad_button_check_pressed(0,global.gp_del))
global.PCAN = true;
else global.PCAN = false;

if (keyboard_check_pressed(global.key_shift) or gamepad_button_check_pressed(0,global.gp_shift))
global.PSEL = true;
else global.PSEL = false;

/*if (keyboard_check_pressed(global.key_inventory) or gamepad_button_check_pressed(0,global.gp_inventory))
global.PINV = true;
else global.PINV = false; */

#endregion
}
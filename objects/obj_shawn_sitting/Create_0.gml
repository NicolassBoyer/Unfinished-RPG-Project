// make it so that our objects higher on the y axis are drawn first
image_speed = 0;
// variables for delayed animation
run_anim = false;
alarm[0] = -1;

visible = false;
has_text = false;

portrait_index = 0;
voice = snd_typewriter;
name = "";
text = [""];
speakers = [id];
next_line = [0];
scripts = -1;
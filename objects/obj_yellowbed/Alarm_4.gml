// if move sounds are still present, stop them, allow player to move
image_speed = 0;
audio_stop_sound(snd_move);
global.canPause = true;
moveReady = true;

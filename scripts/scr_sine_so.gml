///scr_sine_so(freq,amp,so);
var freq = argument[0];
var amplitude = argument[1];
//movement modifiers
var so = argument[2];
var shift = sin(so*pi*freq/room_speed)*amplitude;

return shift;

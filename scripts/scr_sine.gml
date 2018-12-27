///scr_sine(freq,amp);
var freq = argument[0];
var amplitude = argument[1];
//movement modifiers
var so = global.t;
var shift = sin(so*pi*freq/room_speed)*amplitude;

return shift;

/// scr_ease_in_out(time, begin, change, duration);

var t = argument[0]; // time
var b = argument[1]; // begin
var c = argument[2]; // change
var d = argument[3]; // duration

t /= d/2;
if (t < 1) return c/2*t*t + b;
t --;
return -c/2 * (t * (t-2) -1) + b;

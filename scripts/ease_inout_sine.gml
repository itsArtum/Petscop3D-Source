#define ease_inout_sine
///ease_inout_sine(start, end, position)
var _chng = argument[1]-argument[0];
return _chng * 0.5 * (1 - cos(pi * argument[2])) + argument[0];

#define ease_in_sine
///ease_in_sine(start, end, position)
var _chng = argument[1]-argument[0];
return _chng * (1 - cos(argument[2] * (pi / 2))) + argument[0];

#define ease_out_sine
///ease_out_sine(start, end, position)
var _chng = argument[1]-argument[0];
return _chng * sin(argument[2] * (pi / 2)) + argument[0];
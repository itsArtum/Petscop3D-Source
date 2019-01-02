#define ease_inout_cubic
///ease_inout_cubic(start, end, position)
var _pos = argument[2];
var _chng = argument[1]-argument[0];
var _mid = (argument[0]+argument[1]) / 2;

if (_pos < .5)
  return ease_in_cubic(argument[0],_mid,_pos*2)
else
  return ease_out_cubic(_mid,argument[1],(_pos-.5)*2);



#define ease_in_cubic
///ease_in_cubic(start, end, position)
var _chng = argument[1]-argument[0];
return _chng * power(argument[2], 3) + argument[0];

#define ease_out_cubic
///ease_out_cubic(start, end, position)
var _chng = argument[1]-argument[0];
return _chng * (power(argument[2] - 1, 3) + 1) + argument[0];
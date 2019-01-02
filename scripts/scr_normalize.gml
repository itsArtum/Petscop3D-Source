///scr_normalize(x1,x2);

var x1 = argument0;
var x2 = argument1;

var length = sqrt(dot_product(x1,x2,x1,x2));

return x1/length;

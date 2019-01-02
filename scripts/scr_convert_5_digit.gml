//scr_convert_5_digit(number);
var money = argument0
var empty;
    if (money < 0) empty = "NaN"
    if (money >= 0) empty = "0000"
    if (money > 9) empty = "000"
    if (money > 99) empty = "00"
    if (money > 999) empty = "0"
    if (money > 9999) empty = ""

return string(empty)+string(money)

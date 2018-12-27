///scr_approach(current, target, amount);

var current = argument[0];
var target = argument[1];
var amount = argument[2];

// approach the value but do not go over

if (current < target) {
    return min(current+amount, target);
} else {
    return max(current-amount, target);
}

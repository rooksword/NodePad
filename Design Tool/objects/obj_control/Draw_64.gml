/// @desc Draw info

draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _y = 10;
var _pad = 20;

draw_set_colour(keyboard_check(ord("S")) ? c_grey : c_black);
draw_text(10, _y, "Press 'S' to save");
_y += _pad;

draw_set_colour(keyboard_check(vk_backspace) ? c_grey : c_black);
draw_text(10, _y, "Press 'Backspace' to destroy node");
_y += _pad;

draw_set_colour(c_black);
draw_text(10, _y, "'LMB' to select and connect nodes");
_y += _pad;
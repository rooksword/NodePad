/// @desc Variables

randomize();

node_connecting = noone;
node_moving = noone;
move_offset = { x : 0, y : 0 };

node_viewing = noone;

can_change = 0;

// Permanent drawing

surf = surface_create(room_width, room_height);

lines = [];
can_draw = 0;
colours = [c_black, c_red, c_lime, c_blue, c_white];
colour_draw = c_grey;
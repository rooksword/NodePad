/// @desc Variables

randomize();

node_connecting = noone;
node_moving = noone;
node_viewing = noone;
move_offset = { x : 0, y : 0 };

can_change = 0;

// Permanent drawing

surf = surface_create(room_width, room_height);

can_draw = 0;
colours = [c_black, c_red, c_lime, c_blue, c_white];
colour_draw = c_grey;
size_draw = 2;

drawing = false;
view_notes = true;
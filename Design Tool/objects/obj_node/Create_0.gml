/// @desc Variables

connections = [];

uid = irandom(9999);

colour = make_color_hsv(random(255), 255, 255);

surf = surface_create(room_width, room_height);

lines = [];
can_draw = 0;
colours = [c_black, c_red, c_lime, c_blue, c_white];

colour_draw = obj_control.colours[0];
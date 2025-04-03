/// @desc Variables

connections = [];

uid = irandom(9999);

colour = make_color_hsv(random(255), 255, 255);

surf = surface_create(obj_control.width, 720);

lines = [];

can_draw = 0;
draw_rate = 2;
/// @desc Variables

connections = [];
connected = [];

uid = irandom(9999);

colour = make_color_hsv(random(255), 255, 255);

surf = surface_create(room_width, room_height);

lines = [];
can_draw = 0;
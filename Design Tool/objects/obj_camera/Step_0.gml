/// @desc Update

var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);

if !position_meeting(mouse_x, mouse_y, obj_node)
and mouse_check_button(mb_middle)
{
	x -= mouse_x - mouse_xprevious;	
	y -= mouse_y - mouse_yprevious;	
}

x = round(x);
y = round(y);

camera_set_view_pos(view_camera[0], x - _vw / 2, y - _vh / 2);

mouse_xprevious = mouse_x;
mouse_yprevious = mouse_y;
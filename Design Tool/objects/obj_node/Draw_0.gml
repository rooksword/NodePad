/// @desc Draw nodes and surface

if keyboard_check_pressed(ord("1")) colour_draw = colours[0];
if keyboard_check_pressed(ord("2")) colour_draw = colours[1];
if keyboard_check_pressed(ord("3")) colour_draw = colours[2];
if keyboard_check_pressed(ord("4")) colour_draw = colours[3];
if keyboard_check_pressed(ord("5")) colour_draw = colours[4];

#region Draw surface

draw_set_colour(c_black);

if obj_control.node_viewing == id
{
	surface_set_target(surf);

	draw_clear_alpha(c_white, 0);

	if !position_meeting(mouse_x, mouse_y, obj_node)
	{
		#region Create lines
		
		if mouse_check_button_pressed(mb_left)
		{
			array_push(lines, { array : [], colour : colour_draw });
			can_draw = true;
		}

		if can_draw and mouse_check_button(mb_left)
		{
			var _len = array_length(lines) - 1;
			array_push(lines[_len].array, { x : mouse_x, y : mouse_y });	
		}
		
		if mouse_check_button_released(mb_left)
		{
			can_draw = false;	
		}
		
		#endregion
	}
	
	#region Delete lines
		
	if mouse_check_button(mb_right)
	{
		var _len = array_length(lines);
		for (var i = 0; i < _len; i++;)
		{
			var _line = lines[i].array;
			var _line_len = array_length(_line);
			for (var j = 0; j < _line_len; j++;)
			{
				var _p = _line[j];
				if point_distance(mouse_x, mouse_y, _p.x, _p.y) < 10
				{
					array_delete(lines, i, 1);
					_len--;
				}
			}
		}
	}
		
	#endregion
	
	#region Draw lines
	
	var _len = array_length(lines);
	for (var i = 0; i < _len; i++;)
	{
		draw_set_colour(lines[i].colour);
		
		var _line = lines[i].array;
		var _len_line = array_length(_line);
		if _len_line > 1
		{
			for (var j = 0; j < _len_line - 1; j++;)
			{
				var _px = _line[j].x;
				var _py = _line[j].y;
				var _qx = _line[j + 1].x;
				var _qy = _line[j + 1].y;
				
				_px -= obj_camera.x - room_width / 2;
				_py -= obj_camera.y - room_height / 2;
				_qx -= obj_camera.x - room_width / 2;
				_qy -= obj_camera.y - room_height / 2;
				
				draw_line_width(_px, _py, _qx, _qy, 4);
				draw_circle(_qx, _qy, 2, false);
			}
		}
	}
	
	#endregion

	surface_reset_target();

	draw_surface(surf, obj_camera.x - room_width / 2, obj_camera.y - room_height / 2);
}

#endregion

#region Draw lines, arrows, buttons

draw_set_colour(colour);

var _w = 4; // Line width

var _button_selected = false;
var _len = array_length(connections);
for (var i = 0; i < _len; i++;)
{
	var _node = NodeGet(connections[i].object);

	if !instance_exists(_node)
	{
		array_delete(connections, i, 1);
		_len--;
	}
	else
	{
		draw_line_width(x, y, _node.x, _node.y, _w);
	
		#region Draw arrow
	
		var _dir = point_direction(x, y, _node.x, _node.y);
		var _dist = 64;
	
		draw_sprite_ext(spr_arrow, -1, x + dcos(_dir) * _dist, y - dsin(_dir) * _dist, 1, 1, _dir, colour, 1);
	
		#endregion
	
		#region Draw buttons
		
		if obj_control.node_viewing == id
		{
			var _button = connections[i].button;
		
			draw_sprite_ext(spr_button, -1, _button.x, _button.y, _button.w, _button.h, 0, _node.colour, 1);
			
			var _x = sprite_get_width(spr_button) * _button.w / 2;
			var _y = sprite_get_height(spr_button) * _button.h / 2;
			
			if !_button_selected
			and point_in_rectangle(mouse_x, mouse_y, _button.x - _x, _button.y - _y, _button.x + _x, _button.y + _y)
			{
				if keyboard_check(vk_lshift)
				{
					_button.x = mouse_x;
					_button.y = mouse_y;
				}
				
				if keyboard_check(vk_lcontrol)
				{
					_button.h += (mouse_wheel_up() - mouse_wheel_down()) * 0.25;
				}
				else
				{
					_button.w += (mouse_wheel_up() - mouse_wheel_down()) * 0.25;
				}
				
				if keyboard_check_pressed(vk_space) and obj_control.can_change == 0
				{
					obj_control.node_viewing = _node;
					obj_control.can_change = 1;
				}
				
				_button_selected = true;
			}
		}
		
		#endregion
	}
}

if obj_control.node_connecting == id
{
	draw_line_width(x, y, mouse_x, mouse_y, _w);
}

#endregion

var _hover = position_meeting(mouse_x, mouse_y, id) or obj_control.node_connecting == id;

image_alpha = obj_control.node_viewing == id ? 1 : 0.5;

image_blend = merge_colour(colour, c_black, _hover ? 0.33 : 0);

draw_self();

#region Draw UID text

draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//draw_text(x, y, uid);

#endregion
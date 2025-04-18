/// @desc Draw nodes and surface

#region Draw surface

draw_set_colour(c_black);

if obj_control.node_viewing == id
{
	if obj_control.colour_draw < 5
	and !position_meeting(mouse_x, mouse_y, obj_node)
	{
		LinesCreate(lines);
	}
	
	if obj_control.colour_draw == 6
	and mouse_check_button(mb_left)
	{
		LinesDelete(lines);
	}
	
	if array_length(connected) > 0
	{
		with NodeGet(connected[0]) DrawSurface();	
	}
	
	DrawSurface();
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
		
		var _button = connections[i].button;
		
		if obj_control.node_viewing == id
		{
			var _x = sprite_get_width(spr_button) * _button.w / 2;
			var _y = sprite_get_height(spr_button) * _button.h / 2;
			
			var _hover = point_in_rectangle(mouse_x, mouse_y, _button.x - _x, _button.y - _y, _button.x + _x, _button.y + _y);
			
			var _c = merge_colour(_node.colour, c_black, _hover ? 0.33 : 0);
		
			draw_sprite_ext(spr_button, -1, _button.x, _button.y, _button.w, _button.h, 0, _c, 1);
			
			if !_button_selected
			and _hover
			{
				if obj_control.can_change == 0
				and keyboard_check_pressed(vk_space)
				{
					obj_control.node_viewing = _node;
					obj_control.can_change = 1;
				}
				
				if !_button.active
				and keyboard_check_pressed(vk_lshift)
				{
					_button.active = true;
				}
			}

			if _button.active
			{
				_button.x = mouse_x;
				_button.y = mouse_y;
				
				if keyboard_check(vk_lcontrol)
				{
					_button.h += (mouse_wheel_up() - mouse_wheel_down()) * 0.25;
				}
				else
				{
					_button.w += (mouse_wheel_up() - mouse_wheel_down()) * 0.25;
				}
				
				
				if keyboard_check_released(vk_lshift)
				{
					_button.active = false;	
				}
				
				_button_selected = true;
			}
		}
		else
		{
			_button.active = false;
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
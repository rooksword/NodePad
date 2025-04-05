function LinesCreate(_lines)
{
	if mouse_check_button_pressed(mb_left)
	{
		array_push(_lines, { array : [], colour : obj_control.colours[obj_control.colour_draw] });
		can_draw = true;
	}

	if can_draw and mouse_check_button(mb_left)
	{
		var _len = array_length(_lines) - 1;
		array_push(_lines[_len].array, { x : mouse_x, y : mouse_y, size: obj_control.size_draw });	
	}
		
	if mouse_check_button_released(mb_left)
	{
		can_draw = false;
	}
}

function LinesDelete(_lines)
{
	var _len = array_length(_lines);
	for (var i = 0; i < _len; i++;)
	{
		var _line = _lines[i].array;
		var _line_len = array_length(_line);
		for (var j = 0; j < _line_len; j++;)
		{
			var _p = _line[j];
			if point_distance(mouse_x, mouse_y, _p.x, _p.y) < 10
			{
				array_delete(_lines, i, 1);
				_len--;
			}
		}
	}
}

function LinesDraw(_lines)
{
	var _len = array_length(_lines);
	for (var i = 0; i < _len; i++;)
	{
		draw_set_colour(_lines[i].colour);
		
		var _line = _lines[i].array;
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
				
				draw_line_width(_px, _py, _qx, _qy, _line[j].size);
				draw_circle(_qx, _qy, _line[j].size / 2, false);
			}
		}
	}
	
	draw_set_colour(obj_control.colours[obj_control.colour_draw]);
	var _mx = mouse_x;
	var _my = mouse_y;
	_mx -= obj_camera.x - room_width / 2;
	_my -= obj_camera.y - room_height / 2;
	draw_circle(_mx, _my, obj_control.size_draw / 2, false);
}
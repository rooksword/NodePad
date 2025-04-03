/// @desc Edit nodes

if mouse_x < room_width - width
{
	#region Connecting

	if mouse_check_button_pressed(mb_left)
	{
		if position_meeting(mouse_x, mouse_y, obj_node)
		{
			var _inst = instance_position(mouse_x, mouse_y, obj_node);
			node_connecting = _inst;
			node_viewing = _inst;
		}
		else
		{
			instance_create_layer(mouse_x, mouse_y, "Instances", obj_node);
		}
	}

	if node_connecting != noone
	and mouse_check_button_released(mb_left)
	{
		if position_meeting(mouse_x, mouse_y, obj_node)
		{
			var _inst = instance_position(mouse_x, mouse_y, obj_node);
		
			if _inst != node_connecting
			{
				var _in_array = InConnections(_inst, node_connecting.connections);
		
				if _in_array == -1 // Add connection
				{
					array_push(node_connecting.connections, {
						object : _inst.uid,
						button : {
							x: room_width - (width / 2),
							y: room_height / 2,
							w: 2,
							h: 1
						}
					});
				}
				else // Destroy connection
				{
					array_delete(node_connecting.connections, _in_array, 1);
				}
			}
		}
	
		node_connecting = noone;
	}

	#endregion

	#region Moving

	if node_moving == noone
	{
		if mouse_check_button_pressed(mb_right)
		and position_meeting(mouse_x, mouse_y, obj_node)
		{
			var _inst = instance_position(mouse_x, mouse_y, obj_node);
			node_moving = _inst;
			node_viewing = _inst;
		
			move_offset.x = node_moving.x - mouse_x;
			move_offset.y = node_moving.y - mouse_y;
		}
	}
	else
	{
		node_moving.x = mouse_x + move_offset.x;
		node_moving.y = mouse_y + move_offset.y;
	
		if mouse_check_button_released(mb_right)
		{
			node_moving = noone;	
		}
	}

	#endregion
}

if can_change > 0 can_change--;
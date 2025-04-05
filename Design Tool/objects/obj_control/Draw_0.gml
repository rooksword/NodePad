/// @desc Draw permanent sketches

if drawing
{
	if !position_meeting(mouse_x, mouse_y, obj_node)
	{
		LinesCreate(lines);
	}
	
	if mouse_check_button(mb_right)
	{
		LinesDelete(lines);
	}	
}

if view_notes
{
	#region Draw surface

	surface_set_target(surf);

	draw_clear_alpha(c_white, 0);
	
	LinesDraw(lines);

	surface_reset_target();

	draw_surface(surf, obj_camera.x - room_width / 2, obj_camera.y - room_height / 2);

	#endregion
}
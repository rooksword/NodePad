/// @desc Draw permanent sketches

if view_notes
{
	if colour_draw == 5
	and !position_meeting(mouse_x, mouse_y, obj_node)
	{
		LinesCreate(lines);
	}
	
	if colour_draw == 6
	and mouse_check_button(mb_left)
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
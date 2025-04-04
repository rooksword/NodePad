/// @desc Draw permanent sketches

if keyboard_check(vk_escape)
{
	#region Draw surface

	surface_set_target(surf);

	draw_clear_alpha(c_white, 0);

	if !position_meeting(mouse_x, mouse_y, obj_node)
	and keyboard_check(vk_escape)
	{
		LinesCreate(lines);
	}
	
	if mouse_check_button(mb_right)
	{
		LinesDelete(lines);
	}
	
	LinesDraw(lines);

	surface_reset_target();

	draw_surface(surf, obj_camera.x - room_width / 2, obj_camera.y - room_height / 2);

	#endregion
}
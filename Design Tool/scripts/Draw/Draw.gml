function Draw()
{
	surface_set_target(surf);

	draw_clear_alpha(c_white, 0);
	
	LinesDraw(lines);

	surface_reset_target();

	draw_surface(surf, obj_camera.x - room_width / 2, obj_camera.y - room_height / 2);
}
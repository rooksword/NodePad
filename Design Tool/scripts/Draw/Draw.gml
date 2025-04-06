function DrawSurface()
{
	if !surface_exists(surf) surf = surface_create(room_width, room_height);
	
	surface_set_target(surf);

	draw_clear_alpha(c_white, 0);
	
	LinesDraw(lines);

	surface_reset_target();

	var _x = obj_camera.x - room_width / 2;
	var _y = obj_camera.y - room_height / 2;

	draw_surface(surf, _x, _y);
}

function DrawNode()
{
	var _o = 4;

	draw_sprite(spr_shadow, -1, x + _o, y + _o);
	draw_sprite(spr_stroke, -1, x, y);
	draw_self();

	#region Draw UID text

	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	//draw_text(x, y, uid);

	#endregion	
}
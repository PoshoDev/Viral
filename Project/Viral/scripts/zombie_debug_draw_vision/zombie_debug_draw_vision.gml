function zombie_debug_draw_vision(argument0, argument1, argument2) {
	//zombie_debug_draw_vision(x, y, angle)

	var h = 60;

	var mx = argument0;
	var my = argument1;

	var ang = argument2 + 180;

	var ax = mx + h * cos(degtorad(ang));
	var ay = my - h * sin(degtorad(ang));

	var dx = mx - h/2 * cos(degtorad(ang));
	var dy = my + h/2 * sin(degtorad(ang));

	var l = h;

	var px = l * cos(degtorad(ang+90));
	var py = l * sin(degtorad(ang+90));

	var bx = dx + px;
	var by = dy - py

	var cx = dx - px
	var cy = dy + py;


	if (point_in_triangle(obj_char.x, obj_char.y, ax, ay, bx, by, cx, cy))
	    draw_set_color(c_red);

	draw_triangle(ax, ay, bx, by, cx, cy, true);

	draw_set_color(c_white);


}

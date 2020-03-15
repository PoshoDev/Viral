//zombie_debug_draw_vision(x, y, angle)

var h = 20;

var mx = argument0;
var my = argument1;

var ang = argument2;

var ax = mx + h * cos(degtorad(ang));
var ay = my - h * sin(degtorad(ang));

var dx = mx - h/2 * cos(degtorad(ang));
var dy = my + h/2 * sin(degtorad(ang));

var l = h * 1.5 / 2;

var px = l * cos(degtorad(ang+90));
var py = l * sin(degtorad(ang+90));

var bx = dx + px;
var by = dy - py

var cx = dx - px
var cy = dy + py;

draw_triangle_color(ax, ay, bx, by, cx, cy, c_white, c_white, c_white, true);
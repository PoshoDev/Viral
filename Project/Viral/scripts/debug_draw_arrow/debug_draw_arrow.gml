///debug_draw_arrow(object)

var targ = instance_nearest(obj_char.x, obj_char.y, argument0);

if (point_distance(obj_char.x, obj_char.y, targ.x, targ.y) > room_height/8/2)
{
    var ang = point_direction(obj_char.x, obj_char.y, targ.x, targ.y);
    
    draw_set_color(c_red);
    draw_arrow(room_width/2, room_height/3, 
    room_width/2+lengthdir_x(32, ang), room_height/3+lengthdir_y(32, ang), 64);
    
    draw_set_color(c_white);
}
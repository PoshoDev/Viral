
image_speed = 0;

hover = false;
open = false;
embrace = false;

instance_create_depth(x, y, depth+1, obj_floor);

if (instance_place(x-global.len, y, obj_door))
{
    image_xscale *= -1;
    x += global.len;
}

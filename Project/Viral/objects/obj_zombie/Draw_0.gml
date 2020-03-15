direction++;
image_angle = direction + 90;

draw_self();

zombie_draw_arms(dir.left, arms);
zombie_draw_arms(dir.right, arms);

//zombie_debug_draw_vision(x, y, direction);


if (raycast_vision(x, y, direction, 90, global.len*16, obj_char, global.len))
    image_blend = c_red;
else
    image_blend = c_white;

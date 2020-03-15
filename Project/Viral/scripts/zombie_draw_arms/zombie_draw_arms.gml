///zombie_draw_arms(arm, type)

var side = argument0;
var type = argument1;

if (side == dir.left)
    var to = 1;
else if (side == dir.right)
    var to = -1;
else
    show_error("Zombie: Wrong Argument.", true);

var len = global.len;

switch (type)
{
    case arm.chase:
        var arm_x = x + lengthdir_x(len/2, image_angle + 270 + 15*to);
        var arm_y = y + lengthdir_y(len/2, image_angle + 270 + 15*to);
    break;
    
    case arm.idle:
    case arm.walk1:
    case arm.walk2:
        var arm_x = x + lengthdir_x(len/2*to, image_angle);
        var arm_y = y + lengthdir_y(len/2*to, image_angle);
    break;
}

draw_sprite_ext(spr_zombie_arm, type, arm_x, arm_y, image_xscale*to,
image_yscale, image_angle, image_blend, image_alpha);
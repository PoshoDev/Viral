
direction = point_direction(x, y, mouse_x, mouse_y);
image_angle = direction + 90;


sprint = keyboard_check(vk_shift);
spd = spd_max * (sprint + 1);

if (keyboard_check(ord("W")))
    y -= spd;
if (keyboard_check(ord("A")))
    x -= spd;
if (keyboard_check(ord("S")))
    y += spd;
if (keyboard_check(ord("D")))
    x += spd;
    
    
if (mouse_check_button_pressed(mb_right))
    global.door_buffer = -1;
else if (mouse_check_button_released(mb_right))
    global.door_buffer = -2;
    

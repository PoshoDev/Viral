
direction = point_direction(x, y, mouse_x, mouse_y);
image_angle = direction + 90;

// This is just horrible. Placeholder, please fix it.
sprint = keyboard_check(vk_shift);
var spd = spd_max * (sprint + 1);

var spd_x = 0;
var spd_y = 0;

if (keyboard_check(ord("W")))
    spd_y -= spd;
if (keyboard_check(ord("A")))
    spd_x -= spd;
if (keyboard_check(ord("S")))
    spd_y += spd;
if (keyboard_check(ord("D")))
    spd_x += spd;
    
    
if (!place_free(x+spd_x, y))
    spd_x = 0;
    
if (!place_free(x, y+spd_y))
    spd_y = 0;
    
x += spd_x;
y += spd_y;
    
    
// Door thing
if (mouse_check_button_pressed(mb_right))
    global.door_buffer = -1;
else if (mouse_check_button_released(mb_right))
    global.door_buffer = -2;
    

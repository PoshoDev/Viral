
enum arm { chase, walk1, walk2, idle };
enum zomb_alarm { frame };
enum zomb_ai { idle, walk, chase };

ai = zomb_ai.idle;
arms = arm.idle;
image_speed = 0;

sprite_offset_set_middle(sprite_index);

direction = irandom_range(0, 359);

alarm[zomb_alarm.frame] = 10;

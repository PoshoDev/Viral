direction++;
image_angle = direction + 90;

draw_self();

zombie_draw_arms(dir.left, arms);
zombie_draw_arms(dir.right, arms);

zombie_debug_draw_vision(x, y, direction);

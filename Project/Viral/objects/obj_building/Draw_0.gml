
if (inside && image_alpha!=0)
    image_alpha -= 1 / 8;
else if (!inside && image_alpha!=1)
    image_alpha += 1 / 8;

draw_set_color(c_white);
draw_set_alpha(image_alpha);
draw_rectangle(x-ceiling, y-ceiling, x+ceiling-1, y+ceiling-1, false);



///world_generate(precision, tiles_per_chunk, tile_size)

enum bor { left, right, up, down };

var prec = argument0;
var tpc = argument1;
var len = argument2;

var mid_x = room_width / 2;
var mid_y = room_height / 2;
var gap = 2;
var chnk = tpc * len;
var maxd = mid_y - chnk;


// Step 1: Populate
var count = 0;

for (var i=0; i<room_width; i+=chnk)
    for (var j=0; j<room_height; j+=chnk)
        if (!irandom_range(0, floor(point_distance(i, j, mid_x, mid_y)/chnk/2)))
            for (var i2=gap; i2<tpc-gap; i2++)
                for (var j2=gap; j2<tpc-gap; j2++)
                {
                    var make =
                    instance_create_depth(i+len*i2, j+len*j2, 8, obj_grass);
                    
                    // This can definitely be improved upon.
                    if (i2 == gap)
                    {
                        border[count, 0] = make;
                        border[count, 1] = bor.left;
                        count++;
                    }
                    else if (i2 == tpc-gap-1)
                    {
                        border[count, 0] = make;
                        border[count, 1] = bor.right;
                        count++;
                    }
                    else if (j2 == gap)
                    {
                        border[count, 0] = make;
                        border[count, 1] = bor.up;
                        count++;
                    }
                    else if (j2 == tpc-gap-1)
                    {
                        border[count, 0] = make;
                        border[count, 1] = bor.down;
                        count++;
                    }
                }
             
                    
// Step 2: Connect Gaps
/*for (var n=0; n<instance_number(obj_grass); n++)
{
    show_debug_message("Checking "+string(n)+"/"+string(instance_number(obj_grass)))
    var check = instance_find(obj_grass, n);
    
    if (!instance_place(check.x+len, check.y, obj_grass)
    && instance_place(check.x+len*3, check.y, obj_grass))r
        instance_create_depth(check.x+len, check.y, 8, obj_grass);
}*/
var rem = len*gap*2+len;

for (var i=0; i<count; i++)
    switch (border[i, 1])
    {
        case bor.left:
            if (place_free(border[i,0].x-len, border[i,0].y)
            && instance_position(border[i,0].x-rem, border[i,0].y, obj_grass))
                for(var j=0; j<gap; j++)
                    instance_create_depth
                    (border[i,0].x-len*(j+1), border[i,0].y, 7, obj_grass);
        break;
        
        case bor.right:
            if (place_free(border[i,0].x+len, border[i,0].y)
            && instance_position(border[i,0].x+rem, border[i,0].y, obj_grass))
                for(var j=0; j<gap; j++)
                    instance_create_depth
                    (border[i,0].x+len*(j+1), border[i,0].y, 7, obj_grass);
        break;
        
        case bor.up:
            if (place_free(border[i,0].x, border[i,0].y-len)
            && instance_position(border[i,0].x, border[i,0].y-rem, obj_grass))
                for(var j=0; j<gap; j++)
                    instance_create_depth
                    (border[i,0].x, border[i,0].y-len*(j+1), 7, obj_grass);
        break;
        
        case bor.down:
            if (place_free(border[i,0].x, border[i,0].y+len)
            && instance_position(border[i,0].x, border[i,0].y+rem, obj_grass))
                for(var j=0; j<gap; j++)
                    instance_create_depth
                    (border[i,0].x, border[i,0].y+len*(j+1), 7, obj_grass);
        break;
    }
    
    
        
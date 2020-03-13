///world_generate(tiles_per_chunk, tile_size)

enum bor { left, right, up, down };

var tpc = argument0;
var len = argument1;

var mid_x = room_width / 2;
var mid_y = room_height / 2;
var gap = 2;
var chnk = tpc * len;
var maxd = mid_y - chnk;


// Step 1: Populate
show_debug_message("Step 1: Populate...");

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
show_debug_message("Step 2: Connect Gaps...");

var rem = len*gap*2+len;

for (var i=0; i<count; i++)
{
    switch (border[i, 1])
    {
        case bor.left:
            var px = -len;          var py = 0;
            var rx = -rem;          var ry = 0;
            var ax = 1;             var ay = 0;
        break;
        
        case bor.right:
            var px = len;           var py = 0;
            var rx = rem;           var ry = 0;
            var ax = 1;             var ay = 0;
        break;
        
        case bor.up:
            var px = 0;             var py = -len;
            var rx = 0;             var ry = -rem;
            var ax = 0;             var ay = 1;
        break;
        
        case bor.down:
            var px = 0;             var py = len;
            var rx = 0;             var ry = rem;
            var ax = 0;             var ay = 1;
        break;
    }
    
    if (place_free(border[i,0].x+px, border[i,0].y+py)
    && instance_position(border[i,0].x+rx, border[i,0].y+ry, obj_grass))
        for(var j=0; j<gap; j++)
            instance_create_depth(border[i,0].x+(px*(j+1)*ax),
            border[i,0].y+(py*(j+1)*ay), 7, obj_grass);   
}


// Step 3: Fill Water
show_debug_message("Step 3: Fill Water...");

var water_count = 0;

for (var i=0; i<room_width; i+=len)
    for (var j=0; j<room_height; j+=len)
        if (place_free(i, j))
            instance_create_depth(i, j, 8, obj_water);


// Step 4: Smooth Corners
show_debug_message("Step 4: Smooth Corners...");

repeat(3)
    instance_swap_all(obj_water, obj_grass, false, 1, len);

// Step 5: Border Randomness
show_debug_message("Step 5: Border Randomness...");

repeat(5)
    instance_swap_all(obj_water, obj_grass, true, 1, len);
    


// Done!
show_debug_message("Done!");
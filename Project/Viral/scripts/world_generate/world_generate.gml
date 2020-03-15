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
            border[i,0].y+(py*(j+1)*ay), 8, obj_grass);   
}

obj_grass.solid = true;

// Step 3: Border Smoothing
show_debug_message("Step 3: Border Smoothing...");

repeat(tpc/4)
{
    for (var i=0; i<room_width; i+=len)
        for (var j=0; j<room_height; j+=len)
            if (place_free(i, j))
                for (var k=0; k<360; k+=90)
                {
                    var cx = i + lengthdir_x(len, k);
                    var cy = j + lengthdir_y(len, k);
                    
                    if (!place_free(cx, cy))
                    {
                        instance_create_depth(i, j, 8, obj_grass);
                        break;
                    }
                }
    
    obj_grass.solid = true;
}


// Step 4: Border Randomness
show_debug_message("Step 4: Border Randomness...");

var rep = tpc/4; // Play with this, maybe?
var chance = 1;

repeat(rep)
{
    for (var i=0; i<room_width; i+=len)
        for (var j=0; j<room_height; j+=len)
            if (place_free(i, j))
                for (var k=0; k<360; k+=90)
                {
                    var cx = i + lengthdir_x(len, k);
                    var cy = j + lengthdir_y(len, k);
                    
                    if (!place_free(cx, cy))
                    {
                        if (!irandom_range(0, chance))
                            instance_create_depth(i, j, 8, obj_grass);
                            
                        break;
                    }
                }
    
    chance+=0.5;
    obj_grass.solid = true;
}


// Step 4: Beaches
show_debug_message("Step 5: Beaches...");

var rep = tpc; // Play with this, maybe?
var chance = 0;

repeat(rep)
{
    for (var i=0; i<room_width; i+=len)
        for (var j=0; j<room_height; j+=len)
            if (place_free(i, j))
                for (var k=0; k<360; k+=90)
                {
                    var cx = i + lengthdir_x(len, k);
                    var cy = j + lengthdir_y(len, k);
                    
                    if (!place_free(cx, cy))
                    {
                        if (!irandom_range(0, chance))
                            instance_create_depth(i, j, 8, obj_sand);
                            
                        break;
                    }
                }
    
    obj_sand.solid = true;
    chance += 0.25;
}


// Step 6: Fill Water
show_debug_message("Step 6: Fill Water...");

for (var i=0; i<room_width; i+=len)
        for (var j=0; j<room_height; j+=len)
            if (place_free(i, j))
                instance_create_depth(i, j, 8, obj_water);


// Step 7: Houses
show_debug_message("Step 7: Houses...");

repeat(8)
{
    with (all)
        solid = true;
        
    obj_grass.solid = false;
    obj_sand.solid = false;
    
    var len_check = 8 * global.len;
    var done = false;
    
    while(!done)
    {
        var tx = irandom_range(0, room_width/global.len) * global.len;
        var ty = irandom_range(0, room_height/global.len) * global.len;
        
        var c0 = place_free(tx, ty);
        var c1 = place_free(tx+len_check, ty);
        var c2 = place_free(tx, ty+len_check);
        var c3 = place_free(tx+len_check, ty+len_check);
        
        if (c0 && c1 && c2 && c3)
        {
            instance_create_depth(tx, ty, 4, obj_building);
            done = true;
        }
    }
}


// Step 8: Zombies
show_debug_message("Step 8: Zombies...");

repeat(64)
{
    with (all)
        solid = true;
        
    obj_grass.solid = false;
    obj_sand.solid = false;
    
     var len_check = 8 * global.len;
    var done = false;
    
    while(!done)
    {
        var tx = irandom_range(0, room_width/global.len) * global.len;
        var ty = irandom_range(0, room_height/global.len) * global.len;
        
        if (place_free(tx, ty))
        {
            instance_create_depth(tx, ty, 4, obj_zombie);
            done = true;
        }
    }
}


// Done!

obj_grass.solid = false;
obj_sand.solid =  false;
obj_water.solid = false;
obj_floor.solid = false;

show_debug_message("Done!");
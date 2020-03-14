
global.len = 8;
global.tpc = 16;


//randomize();
world_generate(global.tpc, global.len);
        
instance_create_depth(room_width/2, room_height/2, -8, obj_char);

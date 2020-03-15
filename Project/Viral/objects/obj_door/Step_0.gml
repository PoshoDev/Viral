
if (hover && global.door_buffer!=-2)
{
    if (global.door_buffer == -1)
        global.door_buffer = !open;
        
    open = global.door_buffer;
    solid = global.door_buffer;
    image_index = global.door_buffer;
}

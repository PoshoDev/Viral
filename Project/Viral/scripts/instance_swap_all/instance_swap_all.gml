///instance_swap_all(swap_what, swap_to, minimum, square_size)

var what =    argument0;
var to =      argument1;
var minimum = argument2;
var len =     argument3;

for (var i=0; i<instance_number(what); i++)
    addlist[i] = instance_get_touching(what, i, to, 1, len);
    
for (var i=0; i<array_length_1d(addlist); i++)
    with (addlist[i])
    {
        instance_create_depth(x, y, 8, to);
        with (self) instance_destroy();
    }
///instance_get_touching(checking, idno, look_for, minimum, square_size)
function instance_get_touching(argument0, argument1, argument2, argument3, argument4) {

	var check =   instance_find(argument0, argument1);
	var look =    argument2;
	var minimum = argument3;
	var len =     argument4;
        
	with (check)
	{
	    var num = 0;
	    for (var i=0; i<360; i+=90)
	    {
	        var cx = x + lengthdir_x(len, i);
	        var cy = y + lengthdir_y(len, i);
        
	        if (instance_place(cx, cy, look) && ++num>=minimum)
	            return self;
	    }
	}


}

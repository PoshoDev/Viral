///raycast_vision(x, y, direction, range, distance, object, quality)
function raycast_vision(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var x1 =   argument0;
	var y1 =   argument1;
	var dire = argument2;
	var rang = argument3;
	var dist = argument4;
	var objt = argument5;
	var qual = argument6;

	for (var i=0; i<rang; i+=qual/2)
	{
	    var x2 = x1 + lengthdir_x(dist, dire - rang/2 + i);
	    var y2 = y1 + lengthdir_y(dist, dire - rang/2 + i);
    
	    draw_line_color(x1, y1, x2, y2, c_red, c_red);
    
	    if (raycast_check(x1, y1, x2, y2, objt, qual))
	        return true;
	}

	return false;


}

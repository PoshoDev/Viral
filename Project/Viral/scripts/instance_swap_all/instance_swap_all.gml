///instance_swap_all(swap_what, swap_to, random, value, square_size)
function instance_swap_all(argument0, argument1, argument2, argument3, argument4) {

	var what =  argument0;
	var to =    argument1;
	var rand =  argument2;
	var val =   argument3;
	var len =   argument4;

	for (var i=0; i<instance_number(what); i++)
	    if (!rand || !irandom_range(0, val))
	        addlist[i] = instance_get_touching(what, i, to, val, len);
    
	for (var i=0; i<array_length_1d(addlist); i++)
	    with (addlist[i])
	        instance_change(to, true);


}

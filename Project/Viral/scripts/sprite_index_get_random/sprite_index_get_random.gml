///sprite_index_get_random(sprite)
function sprite_index_get_random(argument0) {

	return irandom_range(0, sprite_get_number(argument0)-1);


}

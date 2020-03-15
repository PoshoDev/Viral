
width = 8;
height = 8;

ceiling = width * global.len / 2 - global.len;

inside = false;


// OMG NO
ar[0] = "WWWWWWWW"
ar[1] = "W      W"
ar[2] = "W      W"
ar[3] = "W      W"
ar[4] = "W      W"
ar[5] = "W      W"
ar[6] = "W      W"
ar[7] = "WWWDDWWW"

var object;
var len = global.len;

var mid_x = width * len / 2;
var mid_y = height * len / 2;

for (var i=0; i<width; i++)
    for (var j=0; j<height; j++)
    {
        switch (string_char_at(ar[j], i+1))
        {
            case "W": object = obj_wall;    break;
            case " ": object = obj_floor;   break;
            case "D": object = obj_door;    break;
        }
        
        instance_create_depth(x-mid_x+len*i, y-mid_y+len*j, 4, object);
    }
    
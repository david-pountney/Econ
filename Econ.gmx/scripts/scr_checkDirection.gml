var path = argument0;

var pathDirection = "stopped";

if(path_get_point_x(path,1) > x)
    pathDirection = "right";
if(path_get_point_x(path,1) < x)
    pathDirection = "left";
if(path_get_point_y(path,1) > y)
    pathDirection = "down";
if(path_get_point_y(path,1) < y)
    pathDirection = "up";  
    
return pathDirection;

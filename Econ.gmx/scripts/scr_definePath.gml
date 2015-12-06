var sx = argument0;
var sy = argument1;
var fx = argument2;
var fy = argument3;
var path = argument4;
var unit = argument5;

if(!mp_grid_path(global.pathfindingGrid, path, sx,sy,fx,fy,false)){
    show_message("No path");
    return false;
}
else{
    path_set_kind(path, 0);
    unit.endX = fx;
    unit.endY = fy;
    //show_message(string(path));
    return true;
}

var sx = argument0;
var sy = argument1;
var fx = argument2;
var fy = argument3;
//var gfp = argument4;

if(!mp_grid_path(global.pathfindingGrid, global.path, sx,sy,fx,fy,false)){
    show_message("No path");
    return false;
}
else{
    path_set_kind(global.path, 0);
    return true;
}

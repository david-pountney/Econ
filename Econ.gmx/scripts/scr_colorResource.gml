var resourceName = argument0;
var color = argument1;

var landColor;

global.mapMode = "resourceMapMode";

global.resourceMapMode = resourceName;
global.resourceColor = color;

for(var i =  view_yview[0]; i < view_yview[0] + view_hview[0]; i+=32){
    for(var j = view_xview[0]; j <= view_xview[0] + view_wview[0]; j+=32){
        land = instance_position(j,i, obj_normalLand);
        if(land){
            if(ds_map_exists(land.resource,resourceName))
                land.color = make_color_hsv(color_get_hue(color),min(255 * ds_map_find_value(land.resource,resourceName) / land.maxResourceAmount,255),color_get_value(color));
            else land.color = c_white;
            land.drawOutline = true;
        }
    }
}

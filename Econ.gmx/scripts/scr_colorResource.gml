var resourceName = argument0;
var color = argument1;

var landColor;

for (var i = 0; i < instance_number(obj_normalLand); i += 1)
{
   land[i] = instance_find(obj_normalLand,i);
   if(ds_map_exists(land[i].resource,resourceName))
        land[i].color = make_color_hsv(color_get_hue(color),min(255 * ds_map_find_value(land[i].resource,resourceName) / land[i].maxResourceAmount,255),color_get_value(color));
   else land[i].color = c_white;
}

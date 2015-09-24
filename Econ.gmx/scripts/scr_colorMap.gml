var resourceName = argument0;
var color = argument1;

var landColor;

for (var i = 0; i < instance_number(obj_normalLand); i += 1)
{
   land[i] = instance_find(obj_normalLand,i);
   land[i].color = make_color_hsv(color,min(255 * land[i].resource[resourceName] / land[i].maxResourceAmount,255),255);
}

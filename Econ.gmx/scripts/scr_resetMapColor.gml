var color = argument0;

for (var i = 0; i < instance_number(obj_normalLand); i += 1)
{
   land[i] = instance_find(obj_normalLand,i);
   land[i].color = make_color_hsv(color,100,200);
}

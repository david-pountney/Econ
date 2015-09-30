
for (var i = 0; i < instance_number(obj_normalLand); i += 1)
{
   land[i] = instance_find(obj_normalLand,i);
   //show_message(land[i].color);
   //show_message(land[i].government);
   if(land[i].government != noone){
        land[i].color = land[i].government.color;
   }
   else land[i].color = global.clearColor;
}

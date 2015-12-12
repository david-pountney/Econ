var color = argument0;

global.mapMode = "landMapMode";

for(var i =  view_yview[0]; i <= view_yview[0] + view_hview[0]; i+=32){
    for(var j = view_xview[0]; j <= view_xview[0] + view_wview[0]; j+=32){
       land = instance_position(j,i,obj_normalLand);
       land.color = color;
       land.drawOutline = true;
    }
}

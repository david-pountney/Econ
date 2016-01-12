for(var i =  view_yview[0]; i <= view_yview[0] + view_hview[0]; i+=32){
    for(var j = view_xview[0]; j <= view_xview[0] + view_wview[0]; j+=32){
       land = instance_position(j,i,obj_normalLand);
       if(land != noone){
           if(land.government != noone){
                land.color = land.government.color;
           }
           else land.color = global.whiteHSV;
           land.drawOutline = false;
       }
    }
}

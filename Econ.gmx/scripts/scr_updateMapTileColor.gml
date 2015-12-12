var land = argument0;

if(global.mapMode == "landMapMode") land.color = global.defaultLandColor;
if(global.mapMode == "governmentMapMode"){
   if(land.government != noone){
        land.color = land.government.color;
   }
   else land.color = global.whiteHSV;
   land.drawOutline = false;
}
if(global.mapMode == "resourceMapMode"){
    if(ds_map_exists(land.resource,global.resourceMapMode))
    land.color = make_color_hsv(color_get_hue(global.resourceColor),min(255 * ds_map_find_value(land.resource,global.resourceMapMode) / land.maxResourceAmount,255),color_get_value(global.resourceColor));
    else land.color = c_white;
    if(land.government == global.myGov)   land.drawOutline = true;
}
if(global.mapMode == "businessWealthMapMode"){
    land.color = make_color_hsv(0,0,255);
}

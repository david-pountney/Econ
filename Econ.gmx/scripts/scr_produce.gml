var business = argument0;

business.productStock += business.producePerDay;

business.productProduced.playerAmount += business.producePerDay;

var currentValue = ds_map_find_value(obj_playerResources.resourceAmount,business.productProduced);
if !is_undefined(currentValue){
    var newValue = currentValue + business.producePerDay;
    ds_map_replace(obj_playerResources.resourceAmount,business.productProduced, newValue);
}



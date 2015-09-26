var business = argument0;
var land = argument1;

if(business.resourceStock <= 0) exit;

var landResourceAmount = ds_map_find_value(land.resource,"pop");
var amount = floor(landResourceAmount * .25);

var resourceValue = business.productProduced.value;

var income = amount * resourceValue;

business.cash += income;
business.resourceStock--;


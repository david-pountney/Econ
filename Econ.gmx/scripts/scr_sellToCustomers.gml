var business = argument0;
var land = argument1;

if(business.resourceStock <= 0) exit;

var landResourceAmount = ds_map_find_value(land.resource,"pop");
var amount = (floor(landResourceAmount * .25) * 0.1);

var resourceValue = business.productProduced.value;

var income = amount * resourceValue;

if(busType == "govOwned"){
    global.myGov.cash += income;
}
else if(busType == "capitalistOwned"){
    business.cash += income;
}

business.resourceStock--;


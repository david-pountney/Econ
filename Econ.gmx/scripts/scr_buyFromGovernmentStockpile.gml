goodObj = argument0;
goodIns = instance_find(goodObj, 0);

// The different goods we need to buy
var goodParts;

//The amount of each good left to buy
var goodPartsAmountRemaining;

//Get parts that make up good
var count = 0;
for(i=ds_map_find_first(goodIns.unitMakeUp); count<ds_map_size(goodIns.unitMakeUp); i=ds_map_find_next(goodIns.unitMakeUp,i)) {
    //Get the good we need
    goodParts[count] = instance_find(i,0);
    //Find how much of the good you need
    goodPartsAmountRemaining[count] = ds_map_find_value(goodIns.unitMakeUp,i);
    
    count++;
}

for (var i = 0; i < instance_number(obj_business); i += 1)
{
   business[i] = instance_find(obj_business,i);
   
   //Our government?
   if(business[i].government != global.myGov) continue;
   //BusType is govOwned?
   if(business[i].busType != "govOwned") continue;
   //Does the business have anything in stock?
   if(business[i].productStock < 1) continue;
   
   for (var j = 0; j < array_length_1d(goodParts); j += 1){
        if(business[i].productProduced != goodParts[j]) continue;
        if(goodPartsAmountRemaining[j] < 1) continue;
        
        if(business[i].productStock >= goodPartsAmountRemaining[j]){
            business[i].productStock -= goodPartsAmountRemaining[j];
            goodPartsAmountRemaining[j] = 0;
        }
        else{
            goodPartsAmountRemaining[j] -= business[i].productStock;
            business[i].productStock = 0;
        }
        
        //Assuming we can only have one resource produced per business, we are done here
        break;
   }
   
}

//Check if we have brought all the goods we need
var allGoodsBrought = true;
for (var i = 0; i < array_length_1d(goodParts); i += 1){
    if(goodPartsAmountRemaining[i] > 0) 
        allGoodsBrought = false;
}

return allGoodsBrought;


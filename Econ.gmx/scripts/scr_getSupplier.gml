var obj0 = argument0;

var distance = 0;
var returnedObject = noone;
var bestDistance = 9999;

var listOfPossibleSuppliers = ds_list_create();
var listOfEqualSuppliers = ds_list_create();

var bestRating = 0;

//show_message(obj0);

//If business doesn't yet have a resource, stop looking for a supplier
if(obj0.resourceRequired == noone) exit;

for (var i = 0; i < instance_number(obj_business); i += 1)
{
   business[i] = instance_find(obj_business,i);
   
   //show_message(object_get_name(object_index));
   //show_message(object_get_name(business[i].object_index));
   
   if(object_get_name(object_index) == object_get_name(business[i].object_index)) continue;

   if(business[i] != obj0){
        //Can this business supply someone?
        if(business[i].supplyingFullFlag == true){
            //Is the supplier already supplying this business?
            if(!script_execute(scr_arrayFunctions, business[i].supplying, "contains", obj0)){
            //show_message("supplier full " + string(business[i]));
                continue;
            }
        }
        //show_message("Current business in loop: " + string(business[i]));
        //show_message("Base object is: " + string(obj0.id));
        //Do they work together?
        if(obj0.resourceRequired == business[i].productProduced){
            //Add to list to check later
            ds_list_add(listOfPossibleSuppliers,business[i]);
            
            business[i].rating = 0;
            
            //Quality
            business[i].rating += business[i].productQuality;
            
            if(business[i].rating >= bestRating){
                bestRating = business[i].rating;
            }

        }
   }
}

for(var i = 0; i < ds_list_size(listOfPossibleSuppliers); i += 1){
    var supplier = ds_list_find_value(listOfPossibleSuppliers, i);
   
    if(supplier.rating == bestRating){
        ds_list_add(listOfEqualSuppliers,supplier);
    }
}

if(ds_list_size(listOfEqualSuppliers) == 1){ 
    returnedObject = ds_list_find_value(listOfEqualSuppliers,0);
}
//Else find closest supplier
else{
    for(var i = 0; i < ds_list_size(listOfEqualSuppliers); i += 1){
        supplier = ds_list_find_value(listOfEqualSuppliers, i);
           
        //show_message("Expression 2 is true");
        //var test1 = obj0.resourceRequired;
        //var test2 = business[i].productProduced;
        distance = script_execute(scr_getDistance,obj0, supplier);
        //show_message("distace " + string(distance));
        //show_message("bestdistace " + string(bestDistance));
        if(distance < bestDistance){ 
             bestDistance = distance;
             returnedObject = supplier;
             //show_message("got new ro " + string(returnedObject));
        }
    }
}

if(returnedObject == noone) return returnedObject;

//Add business to suppliers list of supplying
returnedObject.supplying = script_execute(scr_arrayFunctions,returnedObject.supplying,"add",obj0);

for(var i = 0; i < array_length_1d(returnedObject.supplying); i += 1){
    //show_message("Suuplying " + string(returnedObject.supplying[i]));
}

//Check if supplier is now full of business it can supply
if(returnedObject.supplying[0] != noone && returnedObject.supplying[1] != noone && returnedObject.supplying[2] != noone )
    returnedObject.supplyingFullFlag = true;

//Returned business is not the same as it's existing supplier 
if(obj0.supplier != noone){
    if(obj0.supplier != returnedObject){
        //show_message(obj0.supplier.supplying);
        if(instance_exists(obj0.supplier))
            obj0.supplier.supplying = script_execute(scr_arrayFunctions,obj0.supplier.supplying,"remove",obj0);
        //show_message(obj0.supplier.supplying);
    }
}


return returnedObject;

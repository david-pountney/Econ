var obj0 = argument0;
var expression = argument1;

var returnedObject = noone;

//show_message("Instance number: " + string(instance_number(obj_business)));
   
if(expression == "supplier"){
    //show_message("Expression 1 is true");
    returnedObject = script_execute(scr_getSupplier,obj0);
}

//show_message("Returned object is: " + string(returnedObject));
    
return returnedObject;

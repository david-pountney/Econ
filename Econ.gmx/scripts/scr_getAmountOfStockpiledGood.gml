var goodObj = argument0;
var myGov = argument1;
var goodIns = instance_find(goodObj,0);

var totalAmount = 0;

for (var i = 0; i < instance_number(obj_business); i += 1)
{
   business[i] = instance_find(obj_business,i);

   if(myGov == true){
        if(business[i].government != global.myGov){
            //show_message("true");
            //show_message(string(business[i].government));
            //show_message(string(global.myGov));
            continue;
        }
   }
   else
   {
        if(business[i].government == global.myGov){ 
            //show_message("false");
            //show_message(string(business[i].government));
            //show_message(string(global.myGov));
            continue;
        }
   }
        
   if(business[i].productProduced != goodIns) continue;
   if(business[i].productStock < 1) continue;

   totalAmount += business[i].productStock;
}

return totalAmount;

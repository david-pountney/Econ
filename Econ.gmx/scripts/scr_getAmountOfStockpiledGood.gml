var goodObj = argument0;
var goodIns = instance_find(goodObj,0);


var totalAmount = 0;

for (var i = 0; i < instance_number(obj_business); i += 1)
{
   business[i] = instance_find(obj_business,i);

   if(business[i].government != global.myGov) continue;
   if(business[i].productProduced != goodIns) continue;
   if(business[i].productStock < 1) continue;

   totalAmount += business[i].productStock;
}

return totalAmount;

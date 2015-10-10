var business;

for (var i = 0; i < instance_number(obj_business); i += 1)
{
   business[i] = instance_find(obj_business,i);
   if(business[i].government == global.myGov){
        business[i].color = make_color_hsv(47,min(255 * (business[i].cash / business[i].highestCash),255),255);
   }
    business[i].color = make_color_hsv(0,min(255 * (business[i].cash / business[i].highestCash),255),255);
}

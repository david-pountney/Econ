

for (var i = 0; i < instance_number(obj_unit); i += 1)
{
   unit[i] = instance_find(obj_unit,i);
   //Calculate new path
   if(unit[i].path != noone && unit[i].moving){
        with(unit[i]) path_end();
        with(unit[i]){ 
            scr_definePath(x,y,endX,endY,path,id);
            path_start(path, 3,0,1);
        }
   }
}

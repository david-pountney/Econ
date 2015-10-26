menu = argument0;

if(instance_exists(menu)) exit;

//Clear all popups
if(instance_exists(obj_buildMenu)) with(obj_buildMenu) instance_destroy();
if(instance_exists(obj_businessStats)) with(obj_businessStats) instance_destroy();

if(menu == noone) exit;

newPopup = instance_create(0,0,menu);


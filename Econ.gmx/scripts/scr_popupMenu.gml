menu = argument0;

if(instance_exists(menu)) exit;

//Clear all popups
if(instance_exists(obj_buildMenu)) with(obj_buildMenu) instance_destroy();
if(instance_exists(obj_businessStats)) with(obj_businessStats) instance_destroy();
if(instance_exists(obj_techMenu)) with(obj_techMenu) instance_destroy();
if(instance_exists(obj_militaryBuildMenu)) with(obj_militaryBuildMenu) instance_destroy();


if(menu == noone) exit;

newPopup = instance_create(view_xview[0] + view_wport[0] * .5 ,view_yview[0] + view_hport[0] * .5,menu);


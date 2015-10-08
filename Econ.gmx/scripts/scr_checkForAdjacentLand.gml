var startingNode = argument0;
var government = argument1;

//Left
var leftNode;
//Right
var rightNode;
//Up
var upNode;
//Down
var downNode;

leftNode = instance_position(floor((startingNode.x - 32)/32)*32, floor((startingNode.y)/32)*32, obj_normalLand);
rightNode = instance_position(floor((startingNode.x + 32)/32)*32, floor((startingNode.y)/32)*32, obj_normalLand);
upNode = instance_position(floor((startingNode.x)/32)*32, floor((startingNode.y - 32)/32)*32, obj_normalLand);
downNode = instance_position(floor((startingNode.x)/32)*32, floor((startingNode.y + 32)/32)*32, obj_normalLand);

//show_message("ln " + string(leftNode.government));
//show_message(government);

if(leftNode != noone)
    if(leftNode.government == government) return true;
if(rightNode != noone)
    if(rightNode.government == government) return true;
if(upNode != noone)
    if(upNode.government == government) return true;
if(downNode != noone)
    if(downNode.government == government) return true;

return false;

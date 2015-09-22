var startingNode = argument0;
show_message("startingNode " + string(startingNode));
var openList = ds_list_create();
var newList = ds_list_create();

ds_list_add(openList,startingNode);

//Left
var leftNode;
//Right
var rightNode;
//Up
var upNode;
//Down
var downNode;
//Left up
var leftUpNode;
//Left down
var leftDownNode;
//Right up
var rightUpNode;
//Right down
var rightDownNode;


for(var i = 0; i < ds_list_size(openList); i += 1){
    var currentNode = ds_list_find_value(openList, i);
    //Left
    leftNode =  instance_position(floor(currentNode.x-32/32)*32, floor(currentNode.y/32)*32, obj_normalLand)
    if(leftNode != noone && ds_list_find_index(newList,leftNode) == -1) 
        ds_list_add(newList,leftNode);
    //Right
    rightNode =  instance_position(floor(currentNode.x+32/32)*32, floor(currentNode.y/32)*32, obj_normalLand);
    if(rightNode != noone && ds_list_find_index(newList,rightNode) == -1)
        ds_list_add(newList,rightNode);
    //Up
    upNode =  instance_position(floor(currentNode.x/32)*32, floor(currentNode.y-32/32)*32, obj_normalLand);
    if(upNode != noone && ds_list_find_index(newList,upNode) == -1)
        ds_list_add(newList,upNode);
    //Down
    downNode =  instance_position(floor(currentNode.x/32)*32, floor(currentNode.y+32/32)*32, obj_normalLand);
    if(downNode != noone && ds_list_find_index(newList,downNode) == -1)
        ds_list_add(newList,downNode);
    //Left down
    leftDownNode =  instance_position(floor(currentNode.x-32/32)*32, floor(currentNode.y+32/32)*32, obj_normalLand);
    if(leftDownNode != noone && ds_list_find_index(newList,leftDownNode) == -1 )
        ds_list_add(newList,leftDownNode);
    //Left up
    leftUpNode =  instance_position(floor(currentNode.x-32/32)*32, floor(currentNode.y-32/32)*32, obj_normalLand);
    if(leftUpNode != noone && ds_list_find_index(newList,leftUpNode) == -1 )
        ds_list_add(newList,leftUpNode);
    //Right up
    rightUpNode =  instance_position(floor(currentNode.x+32/32)*32, floor(currentNode.y-32/32)*32, obj_normalLand);
    if(rightUpNode != noone && ds_list_find_index(newList,rightUpNode) == -1)
        ds_list_add(newList,rightUpNode);
    //Right down
    rightDownNode =  instance_position(floor(currentNode.x+32/32)*32, floor(currentNode.y+32/32)*32, obj_normalLand);
    if(rightDownNode != noone && ds_list_find_index(newList,rightDownNode) == -1)
        ds_list_add(newList,rightDownNode);
}
show_message("openlist " + string("size of openlist " + string(ds_list_size(openList))));
openList = newList;
newList = ds_list_create();
show_message("openlist " + string("size of openlist " + string(ds_list_size(openList))));

if(leftNode){

}



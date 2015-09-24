var startingNode = argument0;
var resourceName = argument1;
var resourceAmount = argument2;

//show_message("startingNode " + string(startingNode));

var openList = ds_list_create();
var newList = ds_list_create();
var totalList = ds_list_create();

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

var influence = 3;
var amountOfResourceToDeduct = resourceAmount / 4;

startingNode.resource[resourceName] += resourceAmount;
resourceAmount -= amountOfResourceToDeduct;

while(influence > 0){
    //show_message("col " + string(colorIntensity));
    for(var i = 0; i < ds_list_size(openList); i += 1){
        var currentNode = ds_list_find_value(openList, i);
        //Left
        leftNode = instance_position(floor((currentNode.x - 32)/32)*32, floor((currentNode.y)/32)*32, obj_normalLand);
        //show_message("pos " + string(currentNode.x));
        //show_message("lst check " + string(ds_list_find_index(newList,leftNode)));
        if(leftNode != noone && ds_list_find_index(newList,leftNode) == -1 && ds_list_find_index(openList,leftNode) == -1 && ds_list_find_index(totalList,leftNode) == -1){
            leftNode.resource[resourceName] += resourceAmount;
            ds_list_add(newList,leftNode);
            //show_message("added leftNode " + string(leftNode));
        }
        //Right
        rightNode =  instance_position(floor((currentNode.x+32)/32)*32, floor((currentNode.y)/32)*32, obj_normalLand);
        if(rightNode != noone && ds_list_find_index(newList,rightNode) == -1 && ds_list_find_index(openList,rightNode) == -1 && ds_list_find_index(totalList,rightNode) == -1){
            rightNode.resource[resourceName] += resourceAmount;
            ds_list_add(newList,rightNode);
            //show_message("added rightNode " + string(rightNode));
        }
        //Up
        upNode =  instance_position(floor((currentNode.x)/32)*32, floor((currentNode.y-32)/32)*32, obj_normalLand);
        if(upNode != noone && ds_list_find_index(newList,upNode) == -1 && ds_list_find_index(openList,upNode) == -1 && ds_list_find_index(totalList,upNode) == -1){
            upNode.resource[resourceName] += resourceAmount;
            ds_list_add(newList,upNode);
            //show_message("added upNode " + string(upNode));
        }
        //Down
        downNode =  instance_position(floor((currentNode.x)/32)*32, floor((currentNode.y+32)/32)*32, obj_normalLand);
        if(downNode != noone && ds_list_find_index(newList,downNode) == -1 && ds_list_find_index(openList,downNode) == -1 && ds_list_find_index(totalList,downNode) == -1){
            show_message("bug " + string(downNode.resource["pop"]));
            downNode.resource[resourceName] += resourceAmount;
            ds_list_add(newList,downNode);
            //show_message("added downNode " + string(downNode));
        }
        //Left down
        leftDownNode =  instance_position(floor((currentNode.x-32)/32)*32, floor((currentNode.y+32)/32)*32, obj_normalLand);
        if(leftDownNode != noone && ds_list_find_index(newList,leftDownNode) == -1 && ds_list_find_index(openList,leftDownNode) == -1 && ds_list_find_index(totalList,leftDownNode) == -1){
            leftDownNode.resource[resourceName] += resourceAmount;
            ds_list_add(newList,leftDownNode);
            //show_message("added leftDownNode " + string(leftDownNode));
        }
        //Left up
        leftUpNode =  instance_position(floor((currentNode.x-32)/32)*32, floor((currentNode.y-32)/32)*32, obj_normalLand);
        if(leftUpNode != noone && ds_list_find_index(newList,leftUpNode) == -1 && ds_list_find_index(openList,leftUpNode) == -1 && ds_list_find_index(totalList,leftUpNode) == -1){
            leftUpNode.resource[resourceName] += resourceAmount;
            ds_list_add(newList,leftUpNode);
            //show_message("added leftUpNode " + string(leftUpNode));
        }
        //Right up
        rightUpNode =  instance_position(floor((currentNode.x+32)/32)*32, floor((currentNode.y-32)/32)*32, obj_normalLand);
        if(rightUpNode != noone && ds_list_find_index(newList,rightUpNode) == -1 && ds_list_find_index(openList,rightUpNode) == -1 && ds_list_find_index(totalList,rightUpNode) == -1){
            rightUpNode.resource[resourceName] += resourceAmount;
            ds_list_add(newList,rightUpNode);
            //show_message("added rightUpNode " + string(rightUpNode));
        }
        //Right down
        rightDownNode =  instance_position(floor((currentNode.x+32)/32)*32, floor((currentNode.y+32)/32)*32, obj_normalLand);
        if(rightDownNode != noone && ds_list_find_index(newList,rightDownNode) == -1 && ds_list_find_index(openList,rightDownNode) == -1 && ds_list_find_index(totalList,rightDownNode) == -1){
            rightDownNode.resource[resourceName] += resourceAmount;
            ds_list_add(newList,rightDownNode);
            //show_message("added rightDownNode " + string(rightDownNode));
        }
    }

    for(var i = 0; i < ds_list_size(openList); i += 1){
        var node = ds_list_find_value(openList, i);
        ds_list_add(totalList, node);
    }
    
    openList = newList;
    
    newList = ds_list_create();
    influence--;
    resourceAmount -= amountOfResourceToDeduct;
}
//show_message(string("size of openlist " + string(ds_list_size(openList))));
//show_message(string("size of newlist " + string(ds_list_size(newList))));

//show_message(string("size of openlist " + string(ds_list_size(openList))));

if(leftNode){

}



var root = argument0;

if(!position_meeting(root.x, root.y, obj_solid))
    return root;

var currentNode;
var currentNeighbourNode;

var listOfNodes = ds_list_create();
var listOfNeighbours = ds_list_create();

ds_list_add(listOfNodes,root);

var count = 0;
while(ds_list_size(listOfNodes) != 0){
    currentNode = ds_list_find_value(listOfNodes,count);

    rightNode = instance_position(currentNode.x + 32,currentNode.y,obj_normalLand);
    rightDownNode = instance_position(currentNode.x + 32,currentNode.y + 32,obj_normalLand);
    downNode = instance_position(currentNode.x,currentNode.y + 32,obj_normalLand);
    leftDownNode = instance_position(currentNode.x - 32,currentNode.y + 32,obj_normalLand);
    
    leftNode = instance_position(currentNode.x - 32,currentNode.y,obj_normalLand);
    leftUpNode = instance_position(currentNode.x - 32,currentNode.y - 32,obj_normalLand);
    upNode = instance_position(currentNode.x,currentNode.y - 32,obj_normalLand);
    rightUpNode = instance_position(currentNode.x + 32,currentNode.y - 32,obj_normalLand);
    
    ds_list_clear(listOfNeighbours);
    
    ds_list_add(listOfNeighbours, rightNode);
    ds_list_add(listOfNeighbours, rightDownNode);
    ds_list_add(listOfNeighbours, downNode);
    ds_list_add(listOfNeighbours, leftDownNode);
    
    ds_list_add(listOfNeighbours, leftNode);
    ds_list_add(listOfNeighbours, leftUpNode);
    ds_list_add(listOfNeighbours, upNode);
    ds_list_add(listOfNeighbours, rightUpNode);
    
    for(var i = 0; i < ds_list_size(listOfNeighbours); i++){
        //show_message("i " + string(i));
        //show_message("size " + string(ds_list_size(listOfNeighbours)));
        currentNeighbourNode = ds_list_find_value(listOfNeighbours, i);//instance_position(currentNode.x,currentNode.y,obj_normalLand);
        if(currentNeighbourNode == noone)
            show_message("whoops..");
        //show_message("curent neighbour: " + string(currentNeighbourNode));
        //show_message("curent neighbour x: " + string(currentNeighbourNode.x));
        //show_message("curent neighbour y: " + string(currentNeighbourNode.y));
        if(!position_meeting(currentNeighbourNode.x, currentNeighbourNode.y, obj_solid)){
            show_message(string(currentNeighbourNode));
            return currentNeighbourNode;
        }
        //else//    show_message("Collision detected");
        ds_list_add(listOfNodes,currentNeighbourNode);
    }
    
    count++;
}

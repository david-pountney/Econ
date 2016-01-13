var root = argument0;
var onlyMyGov = argument1;
var listOfUnits = argument2;

//if you didn't give a valid tile, get out
if(root == noone)
    return noone;
    
var currentNode;
var currentNeighbourNode;

var listOfNodes = ds_list_create();
var listOfNeighbours = ds_list_create();

ds_list_add(listOfNodes,root);

//Store occupied nodes
var listOfOccupiedNodes = ds_list_create();
    
if(!position_meeting(root.x, root.y, obj_solid)){
    ds_list_add(listOfOccupiedNodes, root);
    var unit = ds_list_find_value(listOfUnits, 0);
    unit.endX = root.x;
    unit.endY = root.y;
}

var count = 0;
var foundAvaliableNode = false;

for(var uc = 1; uc < ds_list_size(listOfUnits); uc++ ){
    foundAvaliableNode = false;
    
    while(ds_list_size(listOfNodes) != 0 && !foundAvaliableNode){
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
            currentNeighbourNode = ds_list_find_value(listOfNeighbours, i);
            if(currentNeighbourNode == noone)
                show_message("whoops..");
              
            if(onlyMyGov)  
                if(currentNeighbourNode.government != global.myGov) continue;
            
            if(!position_meeting(currentNeighbourNode.x, currentNeighbourNode.y, obj_solid)){
                if(ds_list_find_index(listOfOccupiedNodes, currentNeighbourNode) == -1){
                    ds_list_add(listOfOccupiedNodes, currentNeighbourNode);
                    var unit = ds_list_find_value(listOfUnits, uc);
                    unit.endX = currentNeighbourNode.x;
                    unit.endY = currentNeighbourNode.y;
                    foundAvaliableNode = true;
                    
                    break;
                }
            }
            ds_list_add(listOfNodes,currentNeighbourNode);
        }
        
        count++;
    }
}

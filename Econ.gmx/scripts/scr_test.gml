var currentNode;

for(var i =  view_yview[0]; i < view_yview[0] + view_hview[0]; i+=32){
    for(var j = view_xview[0]; j < view_xview[0] + view_wview[0]; j+=32){
        currentNode = instance_position(j,i, obj_normalLand);
        currentNode.color = c_blue;
    }
}

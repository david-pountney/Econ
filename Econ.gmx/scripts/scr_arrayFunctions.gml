array = argument0;
instruct = argument1;
searchedValue = argument2;

//show_message(array_length_1d(array));

if(instruct == "add"){
    for(var i = 0; i < array_length_1d(array); i += 1){
        if(array[i] == searchedValue){
            //show_message("dup is + " + string(array[i]));
            return array;
        }
    }
    for(var i = 0; i < array_length_1d(array); i += 1){
        //show_message(array[i]);

        if(array[i] == noone){
            array[i] = searchedValue;
            //show_message("added + " + string(array[i]));
            return array;
            //exit;
        }
    }
}

if(instruct == "remove"){
    for(var i = array_length_1d(array) - 1; i >= 0; i -= 1){
    //show_message("loop " + string(i));
        if(array[i] == searchedValue){
            array[i] = noone;
            return array;
        }
    }
    return array;
}

if(instruct == "contains"){
    for(var i = array_length_1d(array) - 1; i >= 0; i -= 1){
    //show_message("loop " + string(i));
        if(array[i] == searchedValue){
            return true;
        }
    }
    return false;
}

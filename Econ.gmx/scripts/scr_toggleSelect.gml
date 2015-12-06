//Press
var px = argument0;
var py = argument1;

//Release
var rx = argument2;
var ry = argument3;

//Case
var tlbr = (x>px && x<rx && y>py && y<ry);
var bltr = (x>px && x<rx && y<py && y>ry);
var brtl = (x<px && x>rx && y<py && y>ry);
var trbl = (x<px && x>rx && y>py && y<ry);

if(tlbr || bltr || brtl || trbl){
    selected = true;
    global.amountOfUnitsSelected++;
}
else
    selected = false;
    
    
    

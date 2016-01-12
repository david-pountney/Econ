var number;
var tempString = "";

repeat(4){
    number = floor(random(9));
    tempString += string(number);
}

return base64_encode(tempString);

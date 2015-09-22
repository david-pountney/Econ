obj0 = argument0;
obj1 = argument1;

part1 = 0;
part2 = 0;
distanceToBusiness = 0;

part1 = round(abs((obj0.x - obj1.x)));
//show_message("x sum is: " + string(part1));
part2 = round(abs((obj0.y - obj1.y)));
//show_message("y sum is: " + string(part2));
distanceToBusiness = round((part1 + part2)); // using phythagours to calculate distance
distanceToBusiness = distanceToBusiness / 32;
//show_message("final sum is: " + string(distanceToBusiness));

return distanceToBusiness;

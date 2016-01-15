var originObject = argument0;

if(originObject.moving) exit;
if(!originObject.ableToFire) exit;

if(instance_number(obj_unit) < 2) exit;

instance_deactivate_object(self);
var closestObj = instance_nearest(originObject.x,originObject.y, obj_unit);
instance_activate_object(self);

if(closestObj == noone) exit;

if(closestObj.government == originObject.government) exit;

//trace("orginX " + string(originObject.x));
//trace("orginY " + string(originObject.y));
//trace("closestObj x " + string(closestObj.x));
//trace("closestObj y " + string(closestObj.y));

var targetRange = originObject.range * 32;

if(closestObj.x > ((originObject.x-16) - targetRange))
    if(closestObj.x < ((originObject.x+16) + targetRange))
        if(closestObj.y > ((originObject.y-16) - targetRange))
            if(closestObj.y < ((originObject.y+16) + targetRange)){
                //Inside target range
                ableToFire = false;
                originObject.dayTillReload = global.day + originObject.reloadTime;
                closestObj.hp -= originObject.damage;
                closestObj.justHit = true;
                
                //trace(closestObj.government);
                //trace(global.myGov);
                
                //Multiplayer send message
               // buffer_seek( global.client.Buffer , buffer_seek_start , 0 );
               // buffer_write( global.client.Buffer , buffer_string , "sATTACKUNIT" );
               // buffer_write( global.client.Buffer , buffer_string , closestObj.guid );
                //buffer_write( global.client.Buffer , buffer_u8 , originObject.damage );
            
                //result = network_send_packet( global.client.Socket , global.client.Buffer , buffer_tell( global.client.Buffer ) );
            
            }

//Server Script : ReceivedPacket
var buffer = argument[ 0 ];

var msgid = buffer_read( buffer , buffer_string );

switch( msgid ) {//Case statements go here...

    case "rPING":
        var time = buffer_read( buffer , buffer_u32 );
        ping = current_time - time;
        break;

    case "rGOVADD":
        var landX = buffer_read( buffer , buffer_u16 );
        var landY = buffer_read( buffer , buffer_u16 );
        var landGovernment = buffer_read( buffer , buffer_u32 );    
        
        var land = instance_position(landX,landY,obj_normalLand);
        if(land != noone){
            land.government = landGovernment;
            //show_message(global.mapMode);
            if(global.mapMode == "governmentMapMode")
                script_execute(scr_colorGovernments);
        }
        
        show_message("got message");
        
        break;
        
    case "rJOINROOM":
        room = game_room;
        
        break;
        
    case "rMYGOV":
        var test2 = buffer_read( buffer , buffer_u32 );    
        
        var test3 = instance_find(test2,0);
        show_message(string(test3.test));
        
        break;
        
    default:
        break;
} 

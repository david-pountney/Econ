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
        
    case "rGAMESTRT":
        var gameStart = buffer_read( buffer , buffer_bool ); 
        
        global.gameStart = gameStart;
        //show_message("rGAMESTRT");
        
        break;
        
    case "rSTRTGAME":
        room = game_room;
        //show_message("rSTRTGAME");
        
        break;
        
    default:
        break;
} 

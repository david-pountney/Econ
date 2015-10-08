//Server Script : ReceivedPacket
var buffer = argument[ 0 ];

var msgid = buffer_read( buffer , buffer_string );

var land;

switch( msgid ) {//Case statements go here...

    case "rPING":
        var time = buffer_read( buffer , buffer_u32 );
        ping = current_time - time;
        break;

    case "rGOVADD":
        var landX = buffer_read( buffer , buffer_u16 );
        var landY = buffer_read( buffer , buffer_u16 );
        var landGovernment = buffer_read( buffer , buffer_u32 );    
        
        land = instance_position(landX,landY,obj_normalLand);
        if(land != noone){
            land.government = landGovernment;
            //show_message(global.mapMode);
            if(global.mapMode == "governmentMapMode")
                script_execute(scr_colorGovernments);
        }
        
        //show_message("got message");
        
        break;
        
    case "rJOINROOM":
        room = game_room;
        
        break;
        
    case "rMYGOV":
        var government = buffer_read( buffer , buffer_u32 );    
        var govIns = instance_find(government,0);
        
        global.myGov = govIns;
        land = instance_position(govIns.x,govIns.y,obj_normalLand);
        land.government = global.myGov;

        //first place the view so it centers your object sprite
        view_xview[0] = land.x - view_wview[0] / 2 + 16;
        view_yview[0] = land.y - view_hview[0] / 2 + 16;
        
        //show_message(global.myGov);
        break;
        
    default:
        break;
} 

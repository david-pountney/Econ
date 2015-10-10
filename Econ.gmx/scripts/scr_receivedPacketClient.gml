//Server Script : ReceivedPacket
var buffer = argument[ 0 ];

var msgid = buffer_read( buffer , buffer_string );

var land;
var landX;
var landY;
var landGovernment;
var business;

switch( msgid ) {//Case statements go here...

    case "rPING":
        var time = buffer_read( buffer , buffer_u32 );
        ping = current_time - time;
        break;

    case "rGOVADD":
        landX = buffer_read( buffer , buffer_u16 );
        landY = buffer_read( buffer , buffer_u16 );
        landGovernment = buffer_read( buffer , buffer_u32 );    
        
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
        
    case "rADDBUS":
        landX = buffer_read( buffer , buffer_u16 );
        landY = buffer_read( buffer , buffer_u16 );
        business = buffer_read( buffer , buffer_u32 );    
        
        land = instance_position(landX,landY,obj_normalLand);
        if(land != noone){
            var newBus = instance_create(landX,landY,business); 
            //show_message(global.mapMode);
            //if(global.mapMode == "governmentMapMode")
            //    script_execute(scr_colorGovernments);
        }
        
        //show_message("got message");
        
        break;
        
    default:
        break;
} 

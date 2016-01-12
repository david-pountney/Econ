//Server Script : ReceivedPacket
var buffer = argument[ 0 ];

var msgid = buffer_read( buffer , buffer_string );

var land;
var landX;
var landY;
var landGovernment;
var business;
var good;
var productQuality;

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
        room = GAME_ROOM;
        
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
        var quality = buffer_read( buffer , buffer_u16 );      
        
        land = instance_position(landX,landY,obj_normalLand);
        if(land != noone){
            var newBus = instance_create(landX,landY,business); 
            newBus.productQuality = quality;
            //show_message(global.mapMode);
            if(global.mapMode == "governmentMapMode")
                script_execute(scr_colorGovernments);
        }
        
        //show_message("got message");
        
        break;
        
    case "rPRODUCTQUAL":
        landGovernment = buffer_read( buffer , buffer_u32 );
        good = buffer_read( buffer , buffer_u32 );
        productQuality = buffer_read( buffer , buffer_u16 );    
        
        for (var i = 0; i < instance_number(obj_business); i += 1)
        {
            business[i] = instance_find(obj_business,i);
            if(business[i].government == landGovernment){
                show_message(string(business[i].productProduced));
                show_message(string(good));
                if(business[i].productProduced == good){
                    //show_message(string(business[i].productProduced));
                    business[i].productQuality = productQuality;
                    //show_message(string(productQuality));
                }
            }
        }
        
        global.wheatQuality = productQuality;
        
        break;
        
    case "rUNITADD":
        var unitObj = buffer_read( buffer , buffer_u32 );
        var unitX = buffer_read( buffer , buffer_u16 );
        var unitY= buffer_read( buffer , buffer_u16 );
        government = buffer_read( buffer , buffer_u32 );    
        
        unit = instance_create(unitX,unitY, unitObj);
        unit.government = government;
        
        break;
        
    case "rBUILTBARRACKS":
        var barracksObj = buffer_read( buffer , buffer_u32 );
        var barracksX = buffer_read( buffer , buffer_u16 );
        var barracksY= buffer_read( buffer , buffer_u16 );
        government = buffer_read( buffer , buffer_u32 );    
        
        var barracks = instance_create(barracksX,barracksY, barracksObj);
        barracks.government = government;
        
        break;
        
    case "rMOVEUNIT":
        var unit = buffer_read( buffer , buffer_u32 );
        var unitFinalX = buffer_read( buffer , buffer_u16 );
        var unitFinalY = buffer_read( buffer , buffer_u16 );
        
        unit.foundPath = scr_definePath(unit.x,unit.y, (floor(unitFinalX/32) * 32 + 16), (floor(unitFinalY/32) * 32 + 16), unit.path, unit);

        if(unit.foundPath){
            unit.x = floor(unit.x/32) * 32 + 16;
            unit.y = floor(unit.y/32) * 32 + 16;
            unit.drawPath = true;
            
            with(unit)  path_start(path,3,0,1);
        }
        else with(unit) mp_grid_add_cell(global.pathfindingGrid, floor(x/32), floor(y/32));
        
        break;
        
    default:
        break;
} 

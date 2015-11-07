//Server Script : ReceivedPacket
var buffer = argument[ 0 ];
var socket = argument[ 1 ];

var msgid = buffer_read( buffer , buffer_string );

var landX;
var landY;
var landGovernment;
var business;
var government;
var good;
var productQuality;

switch( msgid ) {//Case statements go here...
    
    case "gPING":
        var time = buffer_read( buffer , buffer_u32 );
        buffer_seek( Buffer , buffer_seek_start , 0 );
        buffer_write( Buffer , buffer_string , "rPING" );
        buffer_write( Buffer , buffer_u32 , time );
        network_send_packet( socket , Buffer , buffer_tell( Buffer ) );
        break;
        
    case "sGOVADD":
        landX = buffer_read( buffer , buffer_u16 );
        landY = buffer_read( buffer , buffer_u16 );
        landGovernment = buffer_read( buffer , buffer_u32 );
        
        buffer_seek( Buffer , buffer_seek_start , 0 );
        buffer_write( Buffer , buffer_string , "rGOVADD" );
        buffer_write( Buffer , buffer_u16 , landX );
        buffer_write( Buffer , buffer_u16 , landY );
        buffer_write( Buffer , buffer_u32 , landGovernment );
        
        for (i=0; i<ds_list_size(obj_server.SocketList); i++) { 
            var currentSocket = ds_list_find_value(obj_server.SocketList, i);
            if(currentSocket != socket)
            //show_message(currentSocket);
                network_send_packet(currentSocket, Buffer, buffer_tell( Buffer )); 
        }
        
        break;

    case "sJOINROOM":
        buffer_seek( Buffer , buffer_seek_start , 0 );
        buffer_write( Buffer , buffer_string , "rJOINROOM" );
        
        
        for (i=0; i<ds_list_size(obj_server.SocketList); i++) { 
            var currentSocket = ds_list_find_value(obj_server.SocketList, i);
            
            //if(currentSocket != socket)
            //show_message("cursocket ");
            network_send_packet(currentSocket, Buffer, buffer_tell( Buffer )); 
        }
        
        break;
        
    case "gMYGOV":
        buffer_seek( Buffer , buffer_seek_start , 0 );
        buffer_write( Buffer , buffer_string , "rMYGOV" );
        
        var position = ds_list_find_index(obj_server.SocketList, socket);
        
        if(position == 0) buffer_write( Buffer , buffer_u32 , obj_gov1 );
        if(position == 1) buffer_write( Buffer , buffer_u32 , obj_gov2 );
        
        network_send_packet(socket, Buffer, buffer_tell( Buffer )); 

        break;
        
    case "sADDBUS":
        landX = buffer_read( buffer , buffer_u16 );
        landY = buffer_read( buffer , buffer_u16 );
        business = buffer_read( buffer , buffer_u32 );
        var quality = buffer_read( buffer , buffer_u16 );
    
        buffer_seek( Buffer , buffer_seek_start , 0 );
        buffer_write( Buffer , buffer_string , "rADDBUS" );
        
        buffer_write( Buffer , buffer_u16 , landX );
        buffer_write( Buffer , buffer_u16 , landY );
        buffer_write( Buffer , buffer_u32 , business );
        buffer_write( Buffer , buffer_u16 , quality );
        
        for (i=0; i<ds_list_size(obj_server.SocketList); i++) { 
            var currentSocket = ds_list_find_value(obj_server.SocketList, i);
            
            if(currentSocket != socket)
            //show_message("cursocket ");
                network_send_packet(currentSocket, Buffer, buffer_tell( Buffer )); 
        }

        break;
        
    case "sPRODUCTQUAL":
        government = buffer_read( buffer , buffer_u32 );
        good = buffer_read( buffer , buffer_u32 );
        productQuality = buffer_read( buffer , buffer_u16 );
    
        buffer_seek( Buffer , buffer_seek_start , 0 );
        buffer_write( Buffer , buffer_string , "rPRODUCTQUAL" );
        
        buffer_write( Buffer , buffer_u32 , government );
        buffer_write( Buffer , buffer_u32 , good );
        buffer_write( Buffer , buffer_u16 , productQuality );
        

        for (i=0; i<ds_list_size(obj_server.SocketList); i++) { 
            var currentSocket = ds_list_find_value(obj_server.SocketList, i);
            if(currentSocket != socket)
            //show_message(currentSocket);
                network_send_packet(currentSocket, Buffer, buffer_tell( Buffer )); 
        }
        
        break;
        
    default:
        break;
} 

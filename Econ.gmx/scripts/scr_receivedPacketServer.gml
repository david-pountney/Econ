//Server Script : ReceivedPacket
var buffer = argument[ 0 ];
var socket = argument[ 1 ];

var msgid = buffer_read( buffer , buffer_string );

switch( msgid ) {//Case statements go here...
    
    case "gPING":
        var time = buffer_read( buffer , buffer_u32 );
        buffer_seek( Buffer , buffer_seek_start , 0 );
        buffer_write( Buffer , buffer_string , "rPING" );
        buffer_write( Buffer , buffer_u32 , time );
        network_send_packet( socket , Buffer , buffer_tell( Buffer ) );
        break;
        
    case "sGOVADD":
        var landX = buffer_read( buffer , buffer_u16 );
        var landY = buffer_read( buffer , buffer_u16 );
        var landGovernment = buffer_read( buffer , buffer_u32 );
        
        buffer_seek( Buffer , buffer_seek_start , 0 );
        buffer_write( Buffer , buffer_string , "rGOVADD" );
        buffer_write( Buffer , buffer_u16 , landX );
        buffer_write( Buffer , buffer_u16 , landY );
        buffer_write( Buffer , buffer_u32 , landGovernment );
        
        for (i=0; i<ds_list_size(obj_server.SocketList); i++) { 
            var currentSocket = ds_list_find_value(obj_server.SocketList, i);
            //show_message(currentSocket);
            network_send_packet(currentSocket, Buffer, buffer_tell( Buffer )); 
        }
        
        break;
        
    default:
        break;
} 

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

    default:
        break;
} 

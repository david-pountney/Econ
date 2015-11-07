var obj = argument0;

var ins = instance_find(obj,0);

var productQuality = 0;

///Give tech
if(global.myGov.cash >= 1000){
    for (var i = 0; i < instance_number(obj_business); i += 1)
    {
        business[i] = instance_find(obj_business,i);
        if(business[i].government == global.myGov){
            if(business[i].productProduced == ins){
                business[i].productQuality++;
                productQuality = business[i].productQuality;
            }
        }
    }
    global.wheatQuality = productQuality;
    global.myGov.cash -= 1000;
    
    //Multiplayer send message
    buffer_seek( global.client.Buffer , buffer_seek_start , 0 );
    buffer_write( global.client.Buffer , buffer_string , "sPRODUCTQUAL" );
    buffer_write( global.client.Buffer , buffer_u32 , global.myGov );
    buffer_write( global.client.Buffer , buffer_u32 , ins );
    buffer_write( global.client.Buffer , buffer_u16 , productQuality );
    
    result = network_send_packet( global.client.Socket , global.client.Buffer , buffer_tell( global.client.Buffer ) );
}

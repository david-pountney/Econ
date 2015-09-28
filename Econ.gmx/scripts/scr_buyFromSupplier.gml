var supplier = argument0;
var buyer = argument1;

if(buyer.pstType == "primary") exit;

script_execute(scr_transaction, supplier, buyer);

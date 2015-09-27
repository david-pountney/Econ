var supplier = argument0;
var buyer = argument1;

if(buyer.pstType == "primary") exit;

if(supplier == noone) exit;

if(supplier.productStock > 0){
    var productCost = supplier.productProduced.value;
    
    var maxAmountSupplierHas = supplier.productStock;
    var maxAmountCanHold = buyer.resourceMaxAmount - buyer.resourceStock;
    var maxAmountCanAfford = floor(buyer.cash / productCost);
   
    //Can't afford any
    if(maxAmountCanAfford < 1) exit;
    
    var amountToBuy;
    
    if(maxAmountCanAfford < maxAmountCanHold) amountToBuy = maxAmountCanAfford;
    else amountToBuy = maxAmountCanHold;
    
    if(amountToBuy > maxAmountSupplierHas) amountToBuy = maxAmountSupplierHas;
    
    //show_message("Amount to buy " + string(amountToBuy));
    
    //Transaction
    buyer.resourceStock += amountToBuy;
    buyer.cash -= (productCost * amountToBuy);
    
    //Make buyer pay import tax
    if(buyer.government != supplier.government){
        
    }
    
    //show_message("Supplier product stock " + string(supplier.productStock));
    supplier.productStock -= amountToBuy;
    supplier.cash += (productCost * amountToBuy);
    
}

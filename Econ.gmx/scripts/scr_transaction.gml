var supplier = argument0;
var buyer = argument1;

if(supplier == noone) exit;

if(supplier.productStock > 0){
    var productCost = supplier.productProduced.value;
    
    var maxAmountSupplierHas = supplier.productStock;
    var maxAmountCanHold = buyer.resourceMaxAmount - buyer.resourceStock;
    
    var maxAmountCanAfford;
    
    var afford = false;
    var attempt = 0;
    var amountCanBuyWithoutImportTax = 0;
    var amountCanBuyWithImportTax = 0;
    var costWithImportTax = 0;
    var importTaxAmount = 0;
    
    var outsideNation = false;
    
    if(buyer.government != supplier.government) outsideNation = true;
        
    while(!afford){
        //Take into account import tax
        if(outsideNation){
            amountCanBuyWithoutImportTax = floor(buyer.cash / productCost) - attempt;
            importTaxAmount = amountCanBuyWithoutImportTax * buyer.government.importTax;
            //show_message(importTaxAmount);
            costWithImportTax = (amountCanBuyWithoutImportTax * productCost) + importTaxAmount;
            if(buyer.cash >= costWithImportTax){
                afford = true;
                amountCanBuyWithImportTax = amountCanBuyWithoutImportTax;
                maxAmountCanAfford = amountCanBuyWithImportTax;
            }   
        }
        else{
            maxAmountCanAfford = floor(buyer.cash / productCost);
            afford = true;
        }
        attempt++;
    }
    
    //Can't afford any
    if(maxAmountCanAfford < 1) exit;
    
    var amountToBuy;
    
    if(maxAmountCanAfford < maxAmountCanHold) amountToBuy = maxAmountCanAfford;
    else amountToBuy = maxAmountCanHold;
    
    if(amountToBuy > maxAmountSupplierHas) amountToBuy = maxAmountSupplierHas;
    
    //show_message("Amount to buy " + string(amountToBuy));
    
    //Transaction
    buyer.resourceStock += amountToBuy;
    
    //Make buyer pay import tax
    if(outsideNation){
        buyer.cash -= (productCost * amountToBuy) + importTaxAmount;
        supplier.government.cash += importTaxAmount;
    }     
    else buyer.cash -= (productCost * amountToBuy);
    
    //show_message("Supplier product stock " + string(supplier.productStock));
    supplier.productStock -= amountToBuy;
    supplier.cash += (productCost * amountToBuy);
    
}

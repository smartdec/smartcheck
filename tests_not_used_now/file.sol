pragma solidity ^0.4.10;

contract Token {


    function Token(string n, string a, uint256 totalSupplyToUse, bool isSecured, bool cMB, string physical, string crypto, uint256 txnTaxToUse, uint256 holdingTaxToUse, uint256 holdingTaxIntervalToUse, bool isPrivateToUse) {
        name = n;
        symbol = a;
        totalSupply = totalSupplyToUse;
        balanceOf[msg.sender] = totalSupplyToUse;
        isSecured = isSecured;
        physicalString = physical;
        cryptoString = crypto;
        canMintBurn = cMB;
        owner = msg.sender;
        txnTax = txnTaxToUse;
        holdingTax = holdingTaxToUse;
        holdingTaxInterval = holdingTaxIntervalToUse;
        if(holdingTaxInterval!=0) {
            lastHoldingTax = now;
            while(getHour(lastHoldingTax)!=21) {
                lastHoldingTax -= 1 hours;
            }
            while(getWeekday(lastHoldingTax)!=5) {
                lastHoldingTax -= 1 days;
            }
            lastHoldingTax -= getMinute(lastHoldingTax) * (1 minutes) + getSecond(lastHoldingTax) * (1 seconds);
        }
        isPrivate = isPrivateToUse;

        addAddress(owner);
    }
    }


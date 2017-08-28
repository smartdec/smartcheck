pragma solidity ^0.4.11;//5a1037

contract SoliditySendValue {//5a1547
    
    address owner;
    
    function SoliditySendValue() {//4fc198, 8a1725
        owner = msg.sender;
    }
    
    function doSomething() {}//8a1725
    
    function comparingBalances(uint _amount) returns (bool) {//8a1725
        if (this.balance == 1543 wei) {//8a1631
            doSomething();
            return true;
        }
        
        if (_amount == this.balance) return false;//8a1631
        if (this.balance ==_amount) return false;//8a1631

        if (this.balance > 100 wei) throw;  //8a1139
        
        return true;
    }
}

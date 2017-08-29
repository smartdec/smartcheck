pragma solidity ^0.4.11;

contract SoliditySendValue {
    
    address owner;//
    
    function SoliditySendValue() {
        owner = msg.sender;
    }
    
    function doSomething() {}

    function comparingBalances(uint _amount) returns (bool) {
        if (this.balance == 1543 wei) {//a91627
            doSomething();
            return true;
        }
        
        if (_amount == this.balance) return false;//a91627
        if (this.balance ==_amount) return false;//a91627

        if (this.balance > 100 wei) throw;
        
        return true;
    }
}

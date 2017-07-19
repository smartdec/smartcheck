pragma solidity ^0.4.11;

contract SoliditySendValue {
    
    address owner;
    
    function SoliditySendValue() {
        owner = msg.sender;
    }
    
    function doSomething() {}
    
    function comparingBalances(uint _amount) returns (bool) {
        if (this.balance == 1543 wei) {//7a3b44
            doSomething();
            return true;
        }
        
        if (_amount == this.balance) return false;//7a3b44
        
        if (this.balance > 100 wei) throw;  // this is ok
        
        return true;
    }
}

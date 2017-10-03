pragma solidity ^0.4.11;

contract SoliditySendValue {
    function comparingBalances(uint _amount) returns (bool) {
        if (this.balance == 1543 wei) {//5094ad
        }

        if (_amount == this.balance) return false;//5094ad
        if (this.balance ==_amount) return false;//5094ad
        if (this.balance > 100 wei) throw;
        if (this.balance >= 100 wei) throw;//2984ad
        if (this.balance <= 100 wei) throw;//3884ad
        if (a == 100 wei) throw;
        return true;
    }
}

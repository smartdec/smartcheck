pragma solidity ^0.4.11;

contract SoliditySendValue {
    function comparingBalances(uint _amount) returns (bool) {
        // <yes> <report> SOLIDITY_BALANCE_EQUALITY 5094ad
        if (this.balance == 1543 wei) {
        }

        // <yes> <report> SOLIDITY_BALANCE_EQUALITY 5094ad
        if (_amount == this.balance) return false;
        // <yes> <report> SOLIDITY_BALANCE_EQUALITY 5094ad
        if (this.balance ==_amount) return false;
        // <yes> <report> SOLIDITY_BALANCE_EQUALITY 58a5bd
        if (this.balance !=_amount) return false;
        if (this.balance > 100 wei) throw;
        if (this.balance >= 100 wei) throw;
        if (a != 100 wei) throw;
        if (a == 100 wei) throw;
        return true;
    }
}

pragma solidity 0.4.24;

contract C {
    function badPrictice(address addr) {
        // <yes> <report> SOLIDITY_BALANCE_EQUALITY 5094ad
        if (this.balance == 100 wei) {
        }
        // <yes> <report> SOLIDITY_BALANCE_EQUALITY 5094ad
        if (address(this).balance != 100 wei) {
        }
        // <yes> <report> SOLIDITY_BALANCE_EQUALITY 5094ad
        if (addr.balance != 100 wei) {
        }
    }

    function goodPrictice(address addr) public {  
        if (this.balance > 100 wei) {
        }
        if (address(this).balance >= 100 wei) {
        }
        if (addr.balance <= 100 wei) {
        }
    }
}

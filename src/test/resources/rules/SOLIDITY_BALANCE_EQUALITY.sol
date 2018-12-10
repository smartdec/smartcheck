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
        // <yes> <report> SOLIDITY_BALANCE_EQUALITY 5094ad
        if((addr.balance) == 0) {
        }
        // <yes> <report> SOLIDITY_BALANCE_EQUALITY 5094ad
        if(1 + addr.balance == 0) {
        }
    }

    function myFoo(uint) returns(uint) {
        return 0;
    }

    function goodPrictice(address addr) public {  
        if(myFoo(addr.balance) == 0) {
        }
        if (this.balance > 100 wei) {
        }
        if (address(this).balance >= 100 wei) {
        }
        if (addr.balance <= 100 wei) {
        }
        if (msg.sender.balance < 100 wei) {
        }
        if (foo(addr).balance >= 100 wei) {
        }
    }

    function foo(address _addr) public returns(address) {
        return _addr;
    }
}

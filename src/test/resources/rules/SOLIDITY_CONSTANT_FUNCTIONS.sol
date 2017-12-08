pragma solidity ^0.4.16;

contract C {
    function returnsenderbalance() returns (uint){
         return msg.sender.balance;
    }
    // <yes> <report> SOLIDITY_CONSTANT_FUNCTIONS 28fa69
    function returnsenderbalance() constant returns (uint){
            return a;
        }
}
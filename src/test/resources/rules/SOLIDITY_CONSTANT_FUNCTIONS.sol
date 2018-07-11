pragma solidity 0.4.24;

contract C {
    function returnsenderbalance() returns (uint){
         return msg.sender.balance;
    }
    // <yes> <report> SOLIDITY_CONSTANT_FUNCTIONS 28fa69
    function returnsenderbalance(uint a) constant returns (uint){
            return a;
        }
}
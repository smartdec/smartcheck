pragma solidity ^0.4.16;

contract C {
    function returnsenderbalance() returns (uint){
         return msg.sender.balance;
    }
    function returnsenderbalance() pure returns (uint){

    }
// <yes> <report> SOLIDITY_IS_IT_PURE_FUNCTIONS bca409
    function returnsenderbalance() returns (uint){
        return a;
    }
}
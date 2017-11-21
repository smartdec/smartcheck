pragma solidity ^0.4.16;

contract C {
// <yes> <report> SOLIDITY_PURE_FUNCTIONS 11314f
    function returnsenderbalance() pure returns (uint){
         return msg.sender.balance;
    }
// <yes> <report> SOLIDITY_PURE_FUNCTIONS 11314f
    function returnsenderbalance() pure returns (uint){
        if (f < this.balance) x.send(10);
        return t;
    }
// <yes> <report> SOLIDITY_PURE_FUNCTIONS 11314f
    function returnsenderbalance() pure returns (uint){
        y=msg.value;
        o=block.timestamp;
        return t;
    }
    function returnsenderbalance() returns (uint){
        y=msg.value;
        o=block.timestamp;
        return t;
    }
}
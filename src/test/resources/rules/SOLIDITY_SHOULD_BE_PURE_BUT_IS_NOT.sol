pragma solidity ^0.4.16;

contract C {
    function returnsenderbalance() returns (uint){
         return msg.sender.balance;
    }
    function returnsenderbalance() pure returns (uint){
        return a;
    }
// <yes> <report> SOLIDITY_SHOULD_BE_PURE_BUT_IS_NOT bca409
    function returnsenderbalance() returns (uint){
        return a;
    }
    function returnsenderbalance() constant returns (uint){
        return a;
    }
    function balanceOf(address who) returns (uint256);
}
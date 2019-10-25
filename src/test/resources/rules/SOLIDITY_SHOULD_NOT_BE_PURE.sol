pragma solidity ^0.4.16;

contract C {
    address f;
// <yes> <report> SOLIDITY_SHOULD_NOT_BE_PURE 11314f
    function returnsenderbalance() pure returns (uint){
         return msg.sender.balance;
    }
// <yes> <report> SOLIDITY_SHOULD_NOT_BE_PURE 11314f
    function returnsenderbalance() pure returns (uint){
        if (f < this.balance) x.send(10);
        return t;
    }
// <yes> <report> SOLIDITY_SHOULD_NOT_BE_PURE 11314f
    function returnsenderbalance() pure returns (uint){
        y=msg.value;
        o=block.timestamp;
        return t;
    }
    // <yes> <report> SOLIDITY_SHOULD_NOT_BE_PURE 11314f
    function returnsenderbalance() pure returns (uint){
        y=msg.value;
        o=block.timestamp;
        selfdestruct(f);
        return t;
    }
    function returnsenderbalance() pure returns (uint){
        return t;
    }
    function test() pure public returns (string memory name) {
        name = type(Math).name;
    }
}
contract Math {
    function Mul(uint a, uint b) pure internal returns (uint) {
      uint c = a * b;
      //check result should not be other wise until a=0
      assert(a == 0 || c / a == b);
      return c;
    }
}
pragma solidity 0.4.24;

library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a / b;
    return c;
  }
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

interface Foo {
    function foo() public returns (uint);
}

contract GasLimitAndLoops {
    using SafeMath for uint256;

    function test_while() public {
        uint x=0;
        Foo addr = Foo(0x0);
        uint[] memory y;
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 38f6c7
        while ( x < addr.foo()) { 
            x++;
        }
        while ( x > 100) {
            x++;
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 17f23a
        while (y[5]<x) {
            x++;
        }
    }

    function test_for() public {
        uint x=0;
        uint[] memory y;
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS f6f853
        for (uint i = 0; i < y.length; i.add(1)){
            x=8;
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS f6f853
        for (i = 0; i < y.length; i++){
            x=8;
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS f6f853
        for (i = 0; i < y.length; i=i+1){
            x=8;
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS f6f853
        for (i = y.length; i <= max(y.length, 4); i += y.length){
            x=8;
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 12cf32
        for (i = y.length; i > 0 ; i.sub(1)){
            x=8;
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 12cf32
        for (i = y.length; i > 0 ; i--){
            x=8;
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 12cf32
        for (i = y.length; i > 0 ; i=i-1){
            x=8;
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 12cf32
        for (x = y.length; x > max(y.length, max(1,2)); x -= y.length){
            x=8;
        }
        for (i = y.length; i < 100; i--){
            x=8;
        }
        for (i = y.length; i < 100; i++){
            x=8;
        }
    }

    function max(uint x,uint y) internal returns (uint){
        return x;
    }

    function heavyLoops(address[] _addr, uint amount) public {
        address addr;
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS a7c89c
        for (uint i = 0; i < _addr.length; i++) {
            addr = _addr[i];
            addr.transfer(amount);
        }
        Foo addr2;
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS a8cb21
        for (i = 0; i < _addr.length; i++) {
            addr2 = Foo(_addr[i]);
            addr2.foo();
        }
    }
}
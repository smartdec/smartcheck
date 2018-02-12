pragma solidity ^0.4.18;

interface Foo {
    function foo() public returns (uint);
}

contract GasLimitAndLoops {
    function test_while() public {
        uint x=0;
        Foo addr = Foo(0x0);
        uint[] y;
        // <yes> <report> SOLIDITY_GAS_LIMIT_AND_LOOPS 38f6c7
        while ( x < addr.foo()) { 
            x++;
        }
        while ( x > 100) {
            x++;
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_AND_LOOPS 17f23a
        while (y[5]<x) {
            x++;
        }
    }

    function test_for() public {
        uint x=0;
        uint[] y;

        // <yes> <report> SOLIDITY_GAS_LIMIT_AND_LOOPS f6f853
        for (uint i = 0; i < y.length; i++){
            x=8;
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_AND_LOOPS f6f853
        for (i = 0; i < y.length; i=i+1){
            x=8;
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_AND_LOOPS f6f853
        for (i = y.length; i <= max(y.length, 4); i += y.length){
            x=8;
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_AND_LOOPS 12cf32
        for (i = y.length; i > 0 ; i--){
            x=8;
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_AND_LOOPS 12cf32
        for (i = y.length; i > 0 ; i=i-1){
            x=8;
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_AND_LOOPS 12cf32
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
}

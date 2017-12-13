pragma solidity ^0.4.18;

contract GasLimitAndLoops {
    function max(uint x,uint y)returns(uint){
        return x;
    }
    function New(){
        require(now==12);
    }
    function foo() {
        uint x=0;
        uint[] y;
        // <yes> <report> SOLIDITY_GAS_LIMIT_AND_LOOPS 38f6c7
        while ( x > max(6,4)) {
            x=1;
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_AND_LOOPS 38f6c7
        while (max(6,4)<x) {
            x=1;
        }
        for(uint bidderIndex = 0; bidderIndex < 1000; bidderIndex++) {
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_AND_LOOPS f6f853
        for (uint i = 0; i < y.length; i++){
            x=8;
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_AND_LOOPS f6f853
        for (uint z = y.length; z <= max(y.length, 4); z += y.length){
            x=8;
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_AND_LOOPS 12cf32
        for ( i = y.length; i > 0 ; i--){
            x=8;
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_AND_LOOPS 12cf32
        for (x =  y.length; x > max(y.length, max(1,2)); x -= y.length){
            x=8;
        }
        for (i = y.length; i < 100; i--){
            x=8;
        }
        for (i = y.length; i < 100; i++){
            x=8;
        }
    }
}
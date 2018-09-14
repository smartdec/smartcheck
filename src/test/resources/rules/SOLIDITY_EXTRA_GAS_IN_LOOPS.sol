pragma solidity 0.4.24;

contract GasInLoops {

    function balance_storage() external view {
    // <yes> <report> SOLIDITY_EXTRA_GAS_IN_LOOPS d3j11j
        for (uint i = 0; i < address(this).balance; i++) {
        }
    }
    function balance_memory() external view {
        uint y = address(this).balance;
        for (uint i = 0; i < y; i++) {
        }
    }
    
    uint[] xx = new uint[](100);
    function length_storage() external view {
        uint i = 0; 
    // <yes> <report> SOLIDITY_EXTRA_GAS_IN_LOOPS k4o1l4
        while (i < xx.length) {
        }
    }
    function length_memory() external view {
        uint y = xx.length;
        uint i = 0;
        while (i < y) {
        }
    }

    uint x = 100;
    function variable_storage() external view {
    // <yes> <report> SOLIDITY_EXTRA_GAS_IN_LOOPS d3j11j
        for (uint i = 0; i < x; i++) {
        }
    }
    function variable_memory() external view{
        uint y = x;
        for (uint i = 0; i < y; i++) {
        }
    }  
}
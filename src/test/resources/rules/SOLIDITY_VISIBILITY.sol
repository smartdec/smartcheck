pragma solidity ^0.4.11;

contract SolidityUncheckedSend {
    // bad
    uint x; //01a1723
    function transfer() { //01a1818
        // public code
    }

    // good
    uint private y;
    function transfer() external {
        // public code
    }

    function internalAction() internal {
        // internal code
    }
}
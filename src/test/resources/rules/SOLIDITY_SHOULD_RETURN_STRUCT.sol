pragma solidity ^0.5.3;

contract C {
    // <yes> <report> SOLIDITY_SHOULD_RETURN_STRUCT 83hf3l
    function f1() external returns(uint a, uint b, uint c, uint d) {
        a = 1;
        b = 2;
    }

    function f2() public returns(uint a, uint b, uint c) {
        a = 1;
        b = 2;
    }

    function foo () public {
        // <yes> <report> SOLIDITY_SHOULD_RETURN_STRUCT e5gh7l
        (uint a, uint b, uint c, uint d) = f1();
    }
}
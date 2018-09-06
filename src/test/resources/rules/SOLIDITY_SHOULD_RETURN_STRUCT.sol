pragma solidity 0.4.24;

contract C {
    // <yes> <report> SOLIDITY_SHOULD_RETURN_STRUCT 7d54ca
    function f1() internal returns(uint a, uint b) {
     a = 1;
     b = 2;
     }
    // <yes> <report> SOLIDITY_SHOULD_RETURN_STRUCT 7d54ca
    function f2() private returns(uint a, uint b) {
     a = 1;
     b = 2;
     }

    function f5() external returns(uint a, uint b) {
     a = 1;
     b = 2;
     }

    function f6() returns(uint a) {
     a = 1;
     }

    function f7() public returns(uint a, uint b) {
     a = 1;
     b = 2;
     }
}
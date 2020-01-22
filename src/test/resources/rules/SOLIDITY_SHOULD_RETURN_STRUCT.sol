pragma solidity 0.4.24;

contract C {
    // <yes> <report> SOLIDITY_SHOULD_RETURN_STRUCT 7d54ca
    function f1() internal returns(uint a, uint b, uint c, uint d) {
        a = 1;
        b = 2;
        c = 3;
        d = 4;
    }
    // <yes> <report> SOLIDITY_SHOULD_RETURN_STRUCT 7d54ca
    function f2() private returns(uint a, uint b, uint c, uint d) {
        a = 1;
        b = 2;
        c = 3;
        d = 4;
    }

    function f5() external returns(uint a, uint b, uint c, uint d) {
        a = 1;
        b = 2;
        c = 3;
        d = 4;
    }

    function f6() returns(uint a) {
        a = 1;
    }

    function f7() public returns(uint a, uint b, uint c, uint d) {
        a = 1;
        b = 2;
        c = 3;
        d = 4;
    }

    function f8() public returns(uint a, uint b) {
        (a, b) = f7();
    }

    function f9() public returns(uint a, uint b, uint c, uint d) {
    // <yes> <report> SOLIDITY_SHOULD_RETURN_STRUCT e5gh7l
        (a, b, c, d) = f2();
    }

    function f10() public returns(uint a) {
        (a, , , ) = f2();
    }
}
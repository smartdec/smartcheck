pragma solidity 0.4.24;

contract UnderFlow {
    uint8 a;

    function foo_1() {
        uint b;
        int c = 1;
    // <yes> <report> SOLIDITY_UINT_CANT_BE_NEGATIVE  11ca45b <yes> <report> SOLIDITY_UINT_CANT_BE_NEGATIVE  d48ac4
        for (uint i=100; i >= 0; i--) {
        }
        for (uint j=0; j <= 0; j--) {
        }
        for (uint k=100; k >= 1; k--) {
        }
    // <yes> <report> SOLIDITY_UINT_CANT_BE_NEGATIVE  d48ac4
        require(a >= 0);
        require(a <= 0);
    // <yes> <report> SOLIDITY_UINT_CANT_BE_NEGATIVE  d48ac4
        require(b >= 0);
        require(b >= 7);
        require(c >= 0);
    }

    struct Mystruct {
        uint a1;
        int a2;
    }

    function foo_2(Mystruct str) internal {
    // <yes> <report> SOLIDITY_UINT_CANT_BE_NEGATIVE  d48ac4
        require(str.a1 >= 0);
        require(str.a2 >= 0);
    }

    mapping(address => uint) balances;
    mapping(address => int) ibalances;

    function foo_3(address user) {
    // <yes> <report> SOLIDITY_UINT_CANT_BE_NEGATIVE  733fdd
        require(balances[user] >= 0);
        require(ibalances[user] >= 0);
    }

    function foo_4() {
        uint i;
    // <yes> <report> SOLIDITY_UINT_CANT_BE_NEGATIVE  11ca45b <yes> <report> SOLIDITY_UINT_CANT_BE_NEGATIVE  d48ac4
        while(i >= 0) {
            i--;
        }
        do {
            i--;
    // <yes> <report> SOLIDITY_UINT_CANT_BE_NEGATIVE  11ca45b <yes> <report> SOLIDITY_UINT_CANT_BE_NEGATIVE  d48ac4
        } while(i >=0);

        for (uint i=100; i <= 0; i++) {
    // <yes> <report> SOLIDITY_UINT_CANT_BE_NEGATIVE  11ca45b <yes> <report> SOLIDITY_UINT_CANT_BE_NEGATIVE  d48ac4
            for (uint i=100; i >= 0; i--) {
            }
        }
    }
}
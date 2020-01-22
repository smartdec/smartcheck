pragma solidity 0.4.24;

contract GasLimitInLoops {
    function foo() pure internal returns (uint) {
        return(100);
    }

    function testWhile() public {
        uint x=0;
        uint[] memory y;
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 38f6c7
        while (x < foo()) {
        }
        while (x > 100) {
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 17f23a
        while (y[5] < x) {
        }
    }

    function testFor(address[] _addr, uint amount) public {

        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 4b7do5
        for (uint i = 0; i < _addr.length; i++) {
        }

        uint n = _addr.length;
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 4b7do5
        for (i = 0; i < n; i++) {
        }

        uint m;
        m = _addr.length;
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 4b7do5
        for (i = 0; i < m; i++) {
        }

        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 4b7do5
        for (uint k; k < _addr.length; k++) {
        }

        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS v5j3d9
        for (i = _addr.length; i > 0; i--) {
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS v5j3d9
        for (uint j = _addr.length; j > 0; j--) {
        }
    }

    address[] stor;

    function testForMemory(address[] memory mem) {

        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 4b7do5
        for (uint i = 0; i < mem.length; i++) {
        }

        uint n = mem.length;
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 4b7do5
        for (i = 0; i < n; i++) {
        }

        uint m;
        m = mem.length;
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 4b7do5
        for (i = 0; i < m; i++) {
        }

        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 4b7do5
        for (uint k; k < mem.length; k++) {
        }

        address[] memory mem2;

        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 4b7do5
        for (i = 0; i < mem2.length; i++) {
        }

        uint n2 = mem2.length;
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 4b7do5
        for (i = 0; i < n2; i++) {
        }

        uint m2;
        m2 = mem2.length;
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 4b7do5
        for (i = 0; i < m2; i++) {
        }

        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 4b7do5
        for (k = 0; k < mem2.length; k++) {
        }

        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 12cf32
        for (uint j = stor.length; j > 0; j--) {
        }

        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS f6f853
        for (k = 0; k < stor.length; k++) {
        }

        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS v5j3d9
        for (i = mem.length; i > 0; i--) {
        }

        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS v5j3d9
        for (j = mem2.length; j > 0; j--) {
        }
    }
}
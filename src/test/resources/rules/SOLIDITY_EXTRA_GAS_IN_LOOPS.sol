pragma solidity 0.4.24;

contract GasInLoops {

    function balanceFor() external view {
    // <yes> <report> SOLIDITY_EXTRA_GAS_IN_LOOPS 5f8g1j
        for (uint i = 0; i < address(this).balance; i++) {
        }
    }

    function balanceWhile() external view {
        uint i = 0;
        // <yes> <report> SOLIDITY_EXTRA_GAS_IN_LOOPS 1f6n9l
        while (i < address(this).balance) {
        }
    }

    function balanceMemoryFor() external view {
        uint y = address(this).balance;
        for (uint i = 0; i < y; i++) {
        }
    }

    uint[] xx = new uint[](100);

    function lengthStorageWhile() external view {
        uint i = 0;
    // <yes> <report> SOLIDITY_EXTRA_GAS_IN_LOOPS v94c8j
        while (i < xx.length) {
        }
    }

    function lengthMemoryWhile() external view {
        uint y = xx.length;
        uint i = 0;
        while (i < y) {
        }
    }

    uint x = 100;

    function variableStorageFor() external view {
    // <yes> <report> SOLIDITY_EXTRA_GAS_IN_LOOPS d3j11j
        for (uint i = 0; i < x; i++) {
        }
    }

    function variableStorageWhile() external view {
        // <yes> <report> SOLIDITY_EXTRA_GAS_IN_LOOPS k4o1l4
        while (i < x) {
        }
    }

    function variableMemoryFor() external view {
        uint y = x;
        for (uint i = 0; i < y; i++) {
        }
    }

    uint constant XXX = 100;

    function variableStorageConstFor() external view {
        for (uint i = 0; i < XXX; i++) {
        }
    }

    function parameterStorageFor(uint[] memory x) public view {
        // <yes> <report> SOLIDITY_EXTRA_GAS_IN_LOOPS v843m7
        for (uint i = 0; i < xx.length; i++) {
        }
    }

    function lengthStorageFor() public view {
        // <yes> <report> SOLIDITY_EXTRA_GAS_IN_LOOPS v843m7
        for (uint i = 0; i < xx.length; i++) {
        }
    }

    function parameterCalldataFor(uint[] calldata x) external view {
        uint[] memory local = x;
        for (uint i = 0; i < local.length; i++) {
        }
    }

    function parameterMemoryCalldataWhile(uint[] memory m) view {
        uint i = 0;

        while (i < m.length) {
        }
    }

    function parameterStorageWhile(uint[] memory x) public view {
        uint i = 0;
        // <yes> <report> SOLIDITY_EXTRA_GAS_IN_LOOPS v94c8j
        while (i < xx.length) {
        }
    }

    function lengthMemoryCalldataWhile(uint[] calldata x) external view {
        uint[] memory y = x;
        while (i < y.length) {
        }
    }

    function lengthStorageWhile(uint[] calldata x) external view {
        uint[] storage y;
        // <yes> <report> SOLIDITY_EXTRA_GAS_IN_LOOPS v94c8j
        while (i < y.length) {
        }
    }

}
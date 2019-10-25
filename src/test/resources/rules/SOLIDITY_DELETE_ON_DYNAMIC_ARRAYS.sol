pragma solidity 0.4.24;

contract C {

    uint[] a;
    byte[] b;
    bytes c;
    string d;

    function storageArrays() external {
        // <yes> <report> SOLIDITY_DELETE_ON_DYNAMIC_ARRAYS  2ft3g5
        delete a;
        // <yes> <report> SOLIDITY_DELETE_ON_DYNAMIC_ARRAYS  2ft3g5
        delete b;
        // <yes> <report> SOLIDITY_DELETE_ON_DYNAMIC_ARRAYS  2ft3g5
        delete c;
        // <yes> <report> SOLIDITY_DELETE_ON_DYNAMIC_ARRAYS  2ft3g5
        delete d;
        // <yes> <report> SOLIDITY_DELETE_ON_DYNAMIC_ARRAYS  2ft3g5
        a.length = 0;
        // <yes> <report> SOLIDITY_DELETE_ON_DYNAMIC_ARRAYS  2ft3g5
        b.length = 0;
        // <yes> <report> SOLIDITY_DELETE_ON_DYNAMIC_ARRAYS  2ft3g5
        c.length = 0;
    }

    function referenceArrays(uint[] storage a3, byte[] storage b3, bytes storage c3, string storage d3) internal {
        // <yes> <report> SOLIDITY_DELETE_ON_DYNAMIC_ARRAYS  6f23y5
        delete a3;
        // <yes> <report> SOLIDITY_DELETE_ON_DYNAMIC_ARRAYS  6f23y5
        delete b3;
        // <yes> <report> SOLIDITY_DELETE_ON_DYNAMIC_ARRAYS  6f23y5
        delete c3;
        // <yes> <report> SOLIDITY_DELETE_ON_DYNAMIC_ARRAYS  6f23y5
        delete d3;
        // <yes> <report> SOLIDITY_DELETE_ON_DYNAMIC_ARRAYS  6f23y5
        a3.length = 0;
        // <yes> <report> SOLIDITY_DELETE_ON_DYNAMIC_ARRAYS  6f23y5
        b3.length = 0;
        // <yes> <report> SOLIDITY_DELETE_ON_DYNAMIC_ARRAYS  6f23y5
        c3.length = 0;
    }

    function argumentsArrays(uint[] memory a1, byte[] memory b1, bytes memory c1, string memory d1) public {
        delete a1;
        delete b1;
        delete c1;
        delete d1;
        a1.length = 0;
        b1.length = 0;
        c1.length = 0;
    }

    function memoryArrays() external {
        uint[] memory a2;
        byte[] memory b2;
        bytes memory c2;
        string memory d2;

        delete a2;
        delete b2;
        delete c2;
        delete d2;
        a2.length = 0;
        b2.length = 0;
        c2.length = 0;
    }
}

pragma solidity 0.4.24;

contract UpgradeTo050_1 {
	// <yes> <report> SOLIDITY_SEND 341gim
    function call(address token, bytes memory a, bytes b) public {
        // <yes> <report> SOLIDITY_SEND 83k1no
        address(token).call();
        // <yes> <report> SOLIDITY_SEND 83k1no
        token.call();
        // <yes> <report> SOLIDITY_SEND 83k1no
        token.call(a,b);
        token.call(abi.encodePacked(a, b));
        // <yes> <report> SOLIDITY_SEND 83k1no
        address(token).call(a,b);
        // <yes> <report> SOLIDITY_SEND 901eae
        bytes32 ab = keccak256(a, b);
        ab = keccak256(abi.encodePacked(a, b));
    }
    // <yes> <report> SOLIDITY_SEND 91h3sa
    function () private {
    }
}

contract UpgradeTo050_2 {
    struct User {
        uint a;
    }
    function numberZero(uint[] memory a) public {
    }
    function numberOne(uint[] storage a) internal {
    }
    // <yes> <report> SOLIDITY_SEND 341gim
    function numberTwo(uint[] a) public {
    }
    function numberTwo2(User memory a) internal {
    }
    // <yes> <report> SOLIDITY_SEND 341gim
    function numberTwo3(User a) internal {
    }
    function numberThree(uint[] a) external {
    }
    // <yes> <report> SOLIDITY_SEND 91h3sa
    function () internal {
    }
}

contract UpgradeTo050_3 {
    uint[] intArray;
    function numberOne() external{
        // <yes> <report> SOLIDITY_SEND 441gim
        uint[] a;
        uint[] storage b = intArray;
        uint[] memory c = intArray;
        
    }
    function () external {
    }
}


contract UpgradeTo050_4 {
    struct User {
        uint a;
    }
    User userStruct;
    function numberOne() {
        // <yes> <report> SOLIDITY_SEND 441gim
        User a;
        User storage b = userStruct;
        User memory c = userStruct;
        
    }
    // <yes> <report> SOLIDITY_SEND 91h3sa
    function () public {
    }
}
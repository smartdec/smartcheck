pragma solidity 0.4.24;

contract UpgradeTo050_1 {
    // <yes> <report> SOLIDITY_UPGRADE_TO_050 341gim
    function call(address token, bytes memory a, bytes b) public {
        // <yes> <report> SOLIDITY_UPGRADE_TO_050 83k1no
        address(token).call();
        // <yes> <report> SOLIDITY_UPGRADE_TO_050 83k1no
        token.call();
        // <yes> <report> SOLIDITY_UPGRADE_TO_050 83k1no
        token.call(a,b);
        token.call(2+2);
        token.call(abi.encodePacked(a, b));
        // <yes> <report> SOLIDITY_UPGRADE_TO_050 83k1no
        address(token).call(a,b);
        // <yes> <report> SOLIDITY_UPGRADE_TO_050 901eae
        bytes32 ab = keccak256(a, b);
        ab = keccak256(abi.encodePacked(a, b));
    }
    // <yes> <report> SOLIDITY_UPGRADE_TO_050 91h3sa
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
    // <yes> <report> SOLIDITY_UPGRADE_TO_050 341gim
    function numberTwo(uint[] a) public {
    }
    // <yes> <report> SOLIDITY_UPGRADE_TO_050 341gim
    function numberTwo_1(uint[] a) {
    }
    // <yes> <report> SOLIDITY_UPGRADE_TO_050 341gim <yes> <report> SOLIDITY_UPGRADE_TO_050 341gim
    function numberTwo0(bytes a, string b) public {
    }
    // <yes> <report> SOLIDITY_UPGRADE_TO_050 341gim
    function numberTwo1() public returns(uint[] a) {
    }
    // <yes> <report> SOLIDITY_UPGRADE_TO_050 341gim
    function numberTwo1_1() returns(uint[] a) {
    }
    function numberTwo2(User memory a) internal {
    }
    // <yes> <report> SOLIDITY_UPGRADE_TO_050 341gim
    function numberTwo3(User a) internal {
    }
    // <yes> <report> SOLIDITY_UPGRADE_TO_050 341gim
    function numberTwo3_1(User a) {
    }
    function numberThree(uint[] a) external {
    }
    // <yes> <report> SOLIDITY_UPGRADE_TO_050 91h3sa
    function () internal {
    }
}

contract UpgradeTo050_3 {
    uint[] intArray;
    function numberOne() external{
        // <yes> <report> SOLIDITY_UPGRADE_TO_050 441gim
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
        // <yes> <report> SOLIDITY_UPGRADE_TO_050 441gim
        User a;
        User storage b = userStruct;
        User memory c = userStruct;

    }
    // <yes> <report> SOLIDITY_UPGRADE_TO_050 91h3sa
    function () public {
    }
}
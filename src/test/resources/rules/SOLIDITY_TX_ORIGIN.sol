pragma solidity 0.6.0;

contract SolidityTxOrigin {
    function dangerousWithdraw() public returns (bool) {
        address owner;
        // <yes> <report> SOLIDITY_TX_ORIGIN 12e802
        if (tx.origin == owner) {
            return true;
        }
        string memory origin = "foo";
        if (msg.sender != tx.origin) {
            revert();
        }
        require(tx.origin == msg.sender);
        // <yes> <report> SOLIDITY_TX_ORIGIN 12e802
        owner = tx.origin;
    }
}

contract Check060 {
    function foo(address a) external returns (bool, bool) {
        try SolidityTxOrigin(a).dangerousWithdraw() returns (bool v) {
            return (v, true);
        } catch Error(string memory reason) {
            return (false, false);
        } catch (bytes memory lowLevelData) {
            return (false, false);
        }
    }
}
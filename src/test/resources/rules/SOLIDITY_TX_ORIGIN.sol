pragma solidity ^0.4.11;

contract SolidityTxOrigin {
    function dangerousWithdraw() returns (bool) {
        address owner;
        // <yes> <report> SOLIDITY_TX_ORIGIN 12e802
        if (tx.origin == owner) {
            return true;
        }
        var origin = "foo";
        if (msg.sender != tx.origin) {
            throw;
        }
        require(tx.origin == msg.sender);
        // <yes> <report> SOLIDITY_TX_ORIGIN 12e802
        owner = tx.origin;
    }
}

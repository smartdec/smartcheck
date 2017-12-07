pragma solidity ^0.4.11;

contract SolidityTxOrigin {
    function dangerousWithdraw(){
        // <yes> <report> SOLIDITY_TX_ORIGIN 12e802
        if (tx.origin == owner) {
            return true;
        }
        var tx = 3;
        var origin = "foo";
        return false;
        if (msg.sender != tx.origin){
            throw;
        }
        require(tx.origin == msg.sender)
        // <yes> <report> SOLIDITY_TX_ORIGIN 12e802
        tx.origin = owner;
    }
}

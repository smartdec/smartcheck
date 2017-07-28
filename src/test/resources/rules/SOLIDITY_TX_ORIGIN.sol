pragma solidity ^0.4.11;

contract SolidityTxOrigin {
    
    address owner;
    uint price;
    
    function SolidityTxOrigin() {//4fc198
        owner = msg.sender;
        price = tx.gasprice;
    }
    
    function dangerousWithdraw() returns (bool) {
        if (tx.origin == owner) {//1336a7
            return true;
        }
        return false;
    }
}

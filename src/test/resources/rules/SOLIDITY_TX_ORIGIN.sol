pragma solidity ^0.4.11;

contract SolidityTxOrigin {
    
    address owner;
    uint price;
    
    function SolidityTxOrigin() {
        owner = msg.sender;
        price = tx.gasprice;
    }
    
    function dangerousWithdraw() returns (bool) {
        if (tx.origin == owner) {//5508c4
            return true;
        }
        return false;
    }
}

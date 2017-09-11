pragma solidity ^0.4.11;

contract SolidityTxOrigin {
    
    address owner;
    uint price;
    
    function SolidityTxOrigin() {
        owner = msg.sender;
        price = tx.gasprice;
    }
    
    function dangerousWithdraw() returns (bool) {
        if (tx.origin == owner) {//a91609
            return true;
        }
        return false;
    }
}

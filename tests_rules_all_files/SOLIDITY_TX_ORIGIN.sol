pragma solidity ^0.4.11;//5a1037

contract SolidityTxOrigin {//5a1547
    
    address owner;
    uint price;
    
    function SolidityTxOrigin() {//4fc198, 8a1725
        owner = msg.sender;
        price = tx.gasprice;
    }
    
    function dangerousWithdraw() returns (bool) {//8a1725
        if (tx.origin == owner) {//5508c4
            return true;
        }
        return false;
    }
}

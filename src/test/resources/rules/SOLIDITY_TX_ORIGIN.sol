pragma solidity ^0.4.11;

contract SolidityTxOrigin {
    function dangerousWithdraw(){
        if (tx.origin == owner) {//a91609
            return true;
        }
        var tx = 3;
        var origin = "foo";
        return false;
    }
}

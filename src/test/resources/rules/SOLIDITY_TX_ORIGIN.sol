pragma solidity ^0.4.11;

contract SolidityTxOrigin {
    function dangerousWithdraw(){
        if (tx.origin == owner) {//12e802
            return true;
        }
        var tx = 3;
        var origin = "foo";
        return false;
    }
}

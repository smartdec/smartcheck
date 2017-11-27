pragma solidity ^0.4.0;
contract C {
    function hashingsha3 (string s)   returns  (bytes32 hash){
     // <yes> <report> SOLIDITY_USING_SHA3  187b5a
        return sha3(s);
    }
}
pragma solidity 0.4.24;

contract C {
	function kill() onlyOwner{
        // <yes> <report> SOLIDITY_DEPRECATED_CONSTRUCTIONS  27cb59
        suicide(owner);
    }
    function hashingsha3 (string s)   returns  (bytes32 hash){
     // <yes> <report> SOLIDITY_DEPRECATED_CONSTRUCTIONS  187b5a
        return sha3(s);
    }

}
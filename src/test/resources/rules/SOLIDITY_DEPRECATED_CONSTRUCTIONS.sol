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
    function delegatecallSetN(address _e, uint _n) {
    // <yes> <report> SOLIDITY_DEPRECATED_CONSTRUCTIONS  49bd2a
        if (_e != address(0)) throw;
    }
    function kill() {
        uint r;
        assembly {
            r := sha3(s)
            suisade()
        }
    }
}

}
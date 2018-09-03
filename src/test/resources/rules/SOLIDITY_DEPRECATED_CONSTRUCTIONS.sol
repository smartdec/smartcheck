pragma solidity 0.4.24;

contract C {
    function kill() {
    // <yes> <report> SOLIDITY_DEPRECATED_CONSTRUCTIONS  27cb59
        suicide(0x0);
    }
    function hashingsha3 (string s)   returns  (bytes32 hash){
     // <yes> <report> SOLIDITY_DEPRECATED_CONSTRUCTIONS  187b5a
        return sha3(s);
    }
    function delegatecallSetN(address _e, uint _n) {
    // <yes> <report> SOLIDITY_DEPRECATED_CONSTRUCTIONS  49bd2a
        if (_e != address(0)) throw;
    }
    function killer() {
        uint r;
        assembly {
            // <yes> <report> SOLIDITY_DEPRECATED_CONSTRUCTIONS  187b5a
            r := sha3('','')
            // <yes> <report> SOLIDITY_DEPRECATED_CONSTRUCTIONS  27cb59
            suicide(0x0)
        }
    }
    // <yes> <report> SOLIDITY_DEPRECATED_CONSTRUCTIONS 28fa69
    function returnSenderBalance(uint a) constant returns (uint){
            return a;
    }

    function usingYears() returns(uint) {
    // <yes> <report> SOLIDITY_DEPRECATED_CONSTRUCTIONS 852kwn
        return 100 years;
    }
}
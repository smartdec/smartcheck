pragma solidity ^0.4.11;

contract SolidityUncheckedSend {
    function unseatKing(address a, uint w) {
        // <yes> <report> SOLIDITY_UNCHECKED_CALL f39eed
        a.call.value(w);
        // <yes> <report> SOLIDITY_UNCHECKED_CALL f39eed
        a.send(w);
        // <yes> <report> SOLIDITY_UNCHECKED_CALL f39eed
        a.delegatecall(w);
    }
    function delegatecallSetN(address _e, uint _n) {
        if (!_e.delegatecall(bytes(sha3("setN(uint256)"), u))) throw;
    }
    function delegatecallSetN(address _e, uint _n) {
        if (!_e.call(bytes(sha3("setN(uint256)"), u))) throw;
    }
    function delegatecallSetN(address _e, uint _n) {
        if (!_e.send(bytes(sha3("setN(uint256)"), u))) throw;
    }
    function delegatecallSetN(address _e, uint _n) {
     // <yes> <report> SOLIDITY_UNCHECKED_CALL f39eed
        requre(e.call(bytes(sha3("setN(uint256)"), u)));
    }
    function delegatecallSetN(address _e, uint _n) {
        assert(_e.send(bytes(sha3("setN(uint256)"), u)));
    }
    function delegatecallSetN(address _e, uint _n) {
         // <yes> <report> SOLIDITY_UNCHECKED_CALL a49egh <yes> <report> SOLIDITY_UNCHECKED_CALL f39eed
            x=_e.send(bytes(sha3("setN(uint256)"), u));
    }

}



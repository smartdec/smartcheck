pragma solidity 0.4.24;

interface Deff {
    function deff(bool) external;
}

contract SolidityUncheckedSend {
    function unseatKing(address a, uint w) public {
        // <yes> <report> SOLIDITY_UNCHECKED_CALL f39eed
        a.call.value(w);
        // <yes> <report> SOLIDITY_UNCHECKED_CALL f39eed
        a.send(w);
        // <yes> <report> SOLIDITY_UNCHECKED_CALL f39eed
        a.delegatecall(w);
        // <yes> <report> SOLIDITY_UNCHECKED_CALL f39eed
        a.callcode(w);
    }
    
    function delegatecallSetN(address _e, uint _n) public {
        if (!_e.delegatecall(bytes4(sha3("setN(uint256)")), _n)) throw;
    }
    
    function delegatecallSetN1(address _e, uint _n) public {
        if (!_e.call(bytes4(sha3("setN(uint256)")), _n)) throw;
    }
    
    function delegatecallSetN2(address _e, uint _n) public {
        if (!_e.send(1)) throw;
    }
    function delegatecallSetN3(address _e, uint _n) public {
        require(_e.call(bytes4(sha3("setN(uint256)")), _n));
    }
    
    function delegatecallSetN4(address _e, uint _n) public {
        assert(_e.call(bytes4(sha3("setN(uint256)")), _n));
    }
    
    function delegatecallSetN5(address _e, uint _n) public {
        assert(_e.callcode(bytes4(sha3("setN(uint256)")), _n));
    }
    
    function returnSend(address a) public returns (bool) {
        return a.send(1);
    }
    
    function checkArg(bool arg) public returns (bool) {
        return arg;
    }
    
    function functionArgumentSend(address a) public returns (bool) {
        return checkArg(a.send(1));
    }
    
    function f1(address y, address a, address d) public {
        bool x = y.send(1);
        checkArg(a.send(1));
        Deff f = Deff(a);
        f.deff(d.send(1));
    }
}
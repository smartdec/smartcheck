pragma solidity ^0.4.11;

contract SolidityUncheckedSend {
    
    address owner;
    
    function SolidityUncheckedSend() {//4fc198
        owner = msg.sender;
    }
    
    function dangerousSend(address _to) returns (bool) {
        if (msg.sender != owner) throw;
        _to.send(this.balance);//19e999
        return true;
    }
    
    function safeSend(address _to) returns (bool) {
        if (msg.sender != owner) throw;
        if (!_to.send(this.balance))
            return false;
        return true;
    }

    function unseatKing(address a, uint w) {
        a.call.value(w);//f68a3a
    }
    function () {
        throw;
    }
    function delegatecallSetN(address _e, uint _n) {
        _e.delegatecall(bytes4(sha3("setN(uint256)")), _n); //19dele
    }
}



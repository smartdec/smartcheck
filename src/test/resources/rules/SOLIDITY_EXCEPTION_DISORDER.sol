pragma solidity ^0.4.11;

contract SolidityUncheckedSend {
    
    address owner;
    
    function SolidityUncheckedSend() {//4fc198
        owner = msg.sender;
    }
    
    function dangerousSend(address _to) returns (bool) {
        if (msg.sender != owner) throw;
        _to.send(this.balance);//1337b7//8a1600
        return true;
    }
    
    function safeSend(address _to) returns (bool) {
        if (msg.sender != owner) throw;
        if (!_to.send(this.balance))//1337b7
            return false;
        return true;
    }

    function unseatKing(address a, uint w) {
        a.call.value(w);//1337b7
    }
    function () {
        throw;
    }
    function delegatecallSetN(address _e, uint _n) {
        _e.delegatecall(bytes(sha3("setN(uint256)"), u)); //1337b7
    }
}



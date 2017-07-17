pragma solidity ^0.4.11;

contract SolidityUncheckedSend {
    
    address owner;
    
    function SolidityUncheckedSend() {
        owner = msg.sender;
    }
    
    function dangerousSend(address _to) returns (bool) {
        if (msg.sender != owner) throw;
        _to.send(this.balance);
        return true;
    }
    
    function safeSend(address _to) returns (bool) {
        if (msg.sender != owner) throw;
        if (!_to.send(this.balance))
            return false;
        return true;
    }
}

pragma solidity ^0.4.11;

contract SoliditySendValue {
    
    address owner;
    
    function SoliditySendValue() {
        owner = msg.sender;
    }
    
    function veryDangerousSend(address _to) returns (bool) {
        if (msg.sender != owner) throw;
        // unsafe against re-entrancy AND doesn't check for result
        _to.call.value(42)();//f68a3a
        return true;
    }
    
    function dangerousSend(address _to) returns (bool) {
        if (msg.sender != owner) throw;
        // checks for result, but still bad (re-entrancy)
        // forwards all gas and triggers external execution
        if (!_to.call.value(42)())//f68a3a
            return false;
        return true;
    }
}
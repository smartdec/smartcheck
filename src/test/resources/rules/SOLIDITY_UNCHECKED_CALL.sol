pragma solidity ^0.4.11;

contract SolidityUncheckedSend {
    function delegatecallSetN(address _e, uint _n) {
            if (!_e.delegatecall(bytes(sha3("setN(uint256)"), u))) throw;
        }
}



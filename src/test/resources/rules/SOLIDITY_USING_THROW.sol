contract SolidityUncheckedSend {
    function delegatecallSetN(address _e, uint _n) {
        // <yes> <report> SOLIDITY_USING_THROW  49bd2a
        if (!_e.delegatecall(bytes(sha3("setN(uint256)"), u))) throw;
    }
}
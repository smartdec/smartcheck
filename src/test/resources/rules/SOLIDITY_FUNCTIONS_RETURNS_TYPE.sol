contract f{
// <yes> <report> SOLIDITY_FUNCTIONS_RETURNS_TYPE 47acc2
    function remainBalanced() public constant returns (uint256){
        uint a =1000;
    }
    function remainBalanced() public constant returns (uint256){
        return balanceOf[this];
    }
    function execute(address _to, uint _value, bytes _data) notNull(_to) onlyOwner external returns (bytes32 _r) {
        _r = addTransaction(_to, _value, _data);
        confirmTransaction(_r);
    }
}
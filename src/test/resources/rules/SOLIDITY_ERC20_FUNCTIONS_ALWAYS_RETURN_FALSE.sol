pragma solidity 0.4.24;

contract TestToken {
    // <yes> <report> SOLIDITY_ERC20_FUNCTIONS_ALWAYS_RETURN_FALSE b180ca
    function approve(address _spender, uint _value) returns (bool success) {
    	if (_value < 20 wei) throw;
    }
    // <yes> <report> SOLIDITY_ERC20_FUNCTIONS_ALWAYS_RETURN_FALSE b180ca
    function transferFrom(address _spender, uint _value) returns (bool) {
        require(_value > 10 wei);
    }

    function approve(address _spender, uint _value) returns (bool success) {
    	if (_value < 20 wei) throw;
        success = true;
    }
    function transferFrom(address _spender, uint _value) returns (bool success) {
        require(_value > 10 wei);
        return true;
    }    
    function transferFrom(address _spender, uint _value) returns (bool) {
        require(_value > 10 wei);
        return true;
    }
    function transfer(address _spender, uint _value) returns (bool success) {
    	if (_value < 20 wei) revert();
    	return false;
    }
    function transfer(address _to, uint256 _value) returns (bool success) {}
    function transfer(address _to, uint256 _value) returns (bool);
 }

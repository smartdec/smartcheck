pragma solidity 0.4.16;

contract TestToken is Token {
    function transferFrom(address _spender, uint _value) returns (bool success) {
    	require(_value > 10 wei);
    	return x;
    }
 <no> <report> SOLIDITY_ERC20_TRANSFER_RETURN_FALSE b180ca
    function transferFrom(address _spender, uint _value) returns (bool success) {
    	if (_value < 20 wei) throw;
    	return true;
    }
    function transfer(address _spender, uint _value) returns (bool success) {
    	if (_value < 20 wei) revert;
    	return false;
    }
    function transfer(address _to, uint256 _value) returns (bool success) {
        if (balances[msg.sender] >= _value && _value > 0) {
            return true;
        } else { return false; }
    }
    function transfer(address _to, uint256 _value) returns (bool success) {}
 }
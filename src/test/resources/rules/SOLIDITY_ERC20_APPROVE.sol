pragma solidity 0.4.24;

contract Token {
// <yes> <report> SOLIDITY_ERC20_APPROVE af782c
    function approve(address _spender, uint _value) returns (bool success) {
    	require(_value > 10 wei);
    	return true;
    }
    function transferFrom(address _spender, uint _value) returns (bool success) {
    	if (_value < 20 wei) throw;
    	return true;
    }
}
contract TestERC20new{
     // <yes> <report> SOLIDITY_ERC20_APPROVE af782c
    function approve(address _spender, uint _value) returns (bool success) {
        require(_value > 10 wei);
     	return true;
    }
    function transferFrom(address _spender, uint _value) returns (bool success) {
        if (_value < 20 wei) throw;
     	return true;
    }
}
contract New is Token {
// <yes> <report> SOLIDITY_ERC20_APPROVE af782c
    function approve(address _spender, uint _value) returns (bool success) {
        require(_value > 10 wei);
       	return true;
    }
    function transferFrom(address _spender, uint _value) returns (bool success) {
        if (_value < 20 wei) throw;
       	return true;
    }
}
contract New2 {
    function approve(address _spender, uint _value) returns (bool success) {
        require(_value > 10 wei);
       	return true;
    }
    function transferFrom(address _spender, uint _value) returns (bool success) {
        if (_value < 20 wei) throw;
       	return true;
    }
}
contract ERC20 {
    function approve(address spender, uint256 value) public returns (bool);
}
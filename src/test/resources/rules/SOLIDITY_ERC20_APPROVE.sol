pragma solidity 0.4.16;

contract TestToken {
// <yes> <report> SOLIDITY_ERC20_APPROVE af782c
    function Approve(address _spender, uint _value) returns (bool success) {
    	require(_value > 10 wei);
    	return x;
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
     	return x;
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
       	return x;
    }
    function transferFrom(address _spender, uint _value) returns (bool success) {
        if (_value < 20 wei) throw;
       	return true;
    }
}
contract New {
    function approve(address _spender, uint _value) returns (bool success) {
        require(_value > 10 wei);
       	return x;
    }
    function transferFrom(address _spender, uint _value) returns (bool success) {
        if (_value < 20 wei) throw;
       	return true;
    }
}
contract ERC20 is ERC20Basic {
    function approve(address spender, uint256 value) public returns (bool);
}
pragma solidity 0.4.16;

contract TestToken is Token {

    // <yes> <report> SOLIDITY_ERC20_API_VIOLATION 550a42
    function approve(address _spender, uint _value) returns (bool success) {
    	require(_value > 10 wei);
    }

    // <yes> <report> SOLIDITY_ERC20_API_VIOLATION 550a42
    function transferFrom(address _spender, uint _value) returns (bool success) {
    	if (_value < 20 wei) throw;
    }

    // <yes> <report> SOLIDITY_ERC20_API_VIOLATION 550a42
    function transfer(address _spender, uint _value) returns (bool success) {
    	if (_value < 20 wei) revert;
    }
 }

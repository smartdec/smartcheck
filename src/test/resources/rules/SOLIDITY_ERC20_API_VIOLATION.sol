pragma solidity 0.4.16;

contract TestToken is Token {

    function approve(address _spender, uint _value) returns (bool success) {//550a42
    	require(_value > 10 wei);
    }

    function transferFrom(address _spender, uint _value) returns (bool success) {//550a42
    	if (_value < 20 wei) throw;
    }

    function transfer(address _spender, uint _value) returns (bool success) {//550a42
    	if (_value < 20 wei) revert;
    }
 }
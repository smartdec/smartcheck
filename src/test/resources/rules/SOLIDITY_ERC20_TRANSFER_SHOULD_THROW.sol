pragma solidity 0.4.24;

interface ERC20 { function transfer(address to, uint value) public returns(bool succes); }

contract CToken{
	// <yes> <report> SOLIDITY_ERC20_TRANSFER_SHOULD_THROW 550a42
	function transfer(uint256 _value) returns (bool success) {
		if (_value > 0) {
			return true;
		}
		else {return false;}
	}
	
	function transfer(address _token, uint _value) returns (bool success) {
		ERC20(_token).transfer(msg.sender, _value);
	}
	function transferFrom(uint _value) returns (bool success) {
		require(_value > 10 wei);
		return false;
	}
	function transferFrom(uint _value) returns (bool success) {
		if (_value < 20 wei) {
			revert();
		}
		return true;
	}
	function transfer(uint value) returns (bool success) {
		return super.transfer(_token,_value);
	}
}
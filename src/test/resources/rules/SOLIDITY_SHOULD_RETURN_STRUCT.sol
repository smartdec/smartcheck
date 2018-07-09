pragma solidity 0.4.24;

contract C {
	// <yes> <report> SOLIDITY_SHOULD_RETURN_STRUCT 7d54ca
	 function f1() internal returns(uint a, uint b) {
	 a=1;
	 b=2;
	 }
	// <yes> <report> SOLIDITY_SHOULD_RETURN_STRUCT 7d54ca
	 function f1() private returns(uint a, uint b) {
	 a=1;
	 b=2;
	 }
	// <yes> <report> SOLIDITY_SHOULD_RETURN_STRUCT 7d54ca
	 function f1() returns(uint a, uint b) {
	 a=1;
	 b=2;
	 }
	// <yes> <report> SOLIDITY_SHOULD_RETURN_STRUCT 7d54ca
	function f2() returns(uint a, uint b);

	function f3() external returns(uint a, uint b) {
	 a=1;
	 b=2;
	 }

	 function f4() returns(uint a) {
	 a=1;
	 }

	function f5() public returns(uint a, uint b) {
	 a=1;
	 b=2;
	 }
}
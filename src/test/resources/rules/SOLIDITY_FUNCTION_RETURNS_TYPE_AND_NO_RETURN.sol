pragma solidity 0.4.24;

contract C {
    // <yes> <report> SOLIDITY_FUNCTION_RETURNS_TYPE_AND_NO_RETURN 47acc2
    function remainBalanced1() public constant returns (uint256){
        uint a =1000;
    }

    function assemblyTest1() public constant returns (uint256){
        assembly {
            mstore(0, 100)
            return(0, 32)
        }
    }
    // <yes> <report> SOLIDITY_FUNCTION_RETURNS_TYPE_AND_NO_RETURN 47acc2
    function remainBalanced2() public constant returns (uint a, uint256){
        a =1000;
    }
    // <yes> <report> SOLIDITY_FUNCTION_RETURNS_TYPE_AND_NO_RETURN 58bdd3
    function execute(address _to, uint _value, bytes _data) returns (uint256 _r) {
        if (_to == address(0)) {
            revert();
        }
    }
    function assemblyTest2(address _to, uint _value, bytes _data) returns (uint256 _r) {
        assembly {
            _r := 100
        }
    }
    // <yes> <report> SOLIDITY_FUNCTION_RETURNS_TYPE_AND_NO_RETURN 58bdd3
    function execute1(address _to, uint _value, bytes _data) returns (uint256 _r) {
        _value = _r;
    }
    // <yes> <report> SOLIDITY_FUNCTION_RETURNS_TYPE_AND_NO_RETURN 58bdd3
    function execute2(address _to, uint _value, bytes _data) returns (bool flag, uint256 _r) {
        flag = true;
        _value = balanceOf(address(_r));
    }

    function balanceOf(address who)public view returns (uint256);

    function remainBalanced() public constant returns (uint256){
        return balanceOf(this);
    }

    function balance(address who)public view returns (uint256 _r);

    function execute3(address _to, uint _value, bytes _data) returns (uint256 _r) {
        _r = balanceOf(_to);
    }

    function execute4(address _to, uint _value, bytes _data) returns (uint256 _r) {
        return balanceOf(_to);
    }
}
pragma solidity 0.4.25;

contract A {

    function foo1(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
        // <yes> <report> SOLIDITY_WRONG_SIGNATURE ui25n6
        require(_spender.call(bytes4(bytes32(sha3("receiveApproval(address,uint,address,bytes)"))), msg.sender, _value, this, _extraData));
        return true;
    }

    function foo2(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
        // <yes> <report> SOLIDITY_WRONG_SIGNATURE ui25n6
        require(_spender.call(bytes4(bytes32(keccak256("receiveApproval(address,uint,address,bytes)"))), msg.sender, _value, this, _extraData));
        return true;
    }

    function foo3(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
        require(_spender.call(bytes4(bytes32(sha3("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData));
        return true;
    }

    function foo4(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
        require(_spender.call(bytes4(bytes32(keccak256("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData));
        return true;
    }

    function foo5(address _spender, uint256 _value, bytes _extraData) {
        // <yes> <report> SOLIDITY_WRONG_SIGNATURE ui25n6
        _spender.call(bytes4(sha3("receiveApproval(address,uint,address,bytes)")), msg.sender, _value, this, _extraData);
    }

    function foo6(address _spender, uint256 _value, bytes _extraData) {
        _spender.call(bytes4(sha3("receiveApproval(address,address,bytes)")), msg.sender, _value, this, _extraData);
    }

}
}
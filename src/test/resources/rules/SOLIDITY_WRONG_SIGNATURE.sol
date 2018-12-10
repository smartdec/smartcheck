pragma solidity 0.4.25;

contract A {

    function foo1(address _spender, uint _value) public returns (bool success) {
        // <yes> <report> SOLIDITY_WRONG_SIGNATURE ui25n6
        require(_spender.call.value(10).gas(11)(bytes4(bytes32(sha3("receiveApproval(address,uint)"))), msg.sender, _value));
        return true;
    }

    function foo2(address _spender, int _value) public returns (bool success) {
        // <yes> <report> SOLIDITY_WRONG_SIGNATURE ui25n6
        require(_spender.call(bytes4(bytes32(keccak256("receiveApproval(address,int,address)"))), msg.sender, _value, this));
        return true;
    }

    function foo3(address _spender, uint256 _value) public returns (bool success) {
        require(_spender.call(bytes4(bytes32(sha3("receiveApproval(address,uint256,address)"))), msg.sender, _value, this));
        return true;
    }

    function foo4(address _spender, int256 _value) public returns (bool success) {
        require(_spender.call(bytes4(bytes32(keccak256("receiveApproval(address,int256)"))), msg.sender, _value));
        return true;
    }

    function foo5(address _spender, uint _value ) public returns (bool success) {
        // <yes> <report> SOLIDITY_WRONG_SIGNATURE ui25n6
        return _spender.call.gas(11)(bytes4(sha3("receiveApproval(address,uint)")), msg.sender, _value);
    }

    function foo6(address _spender, int _value ) public returns (bool success) {
        // <yes> <report> SOLIDITY_WRONG_SIGNATURE ui25n6
        return _spender.call(bytes4(keccak256("receiveApproval(address,int, address)")), msg.sender, _value, this);
    }

    function foo7(address _spender, uint256 _value) public returns (bool success) {
        return _spender.call.value(10)(bytes4(sha3("receiveApproval(address,address)")), msg.sender, this);
    }

    function foo8(address _spender, uint _value) public returns (bool success) {
        // <yes> <report> SOLIDITY_WRONG_SIGNATURE rec155
        return _spender.call(abi.encodeWithSignature("receiveApproval(address,uint)"), msg.sender, _value);
    }

    function foo9(address _spender, int _value) public returns (bool success) {
        // <yes> <report> SOLIDITY_WRONG_SIGNATURE rec155
        return _spender.call(abi.encodeWithSignature("receiveApproval(address,int)"), msg.sender, _value);
    }

    function foo10(address _spender, uint _value) public returns (bool success) {
        // <yes> <report> SOLIDITY_WRONG_SIGNATURE rec155
        return _spender.call(abi.encodeWithSignature("receiveApproval(uint,address)"), _value, msg.sender);
    }

    function foo11(address _spender, uint256 _value) public returns (bool success) {
        return _spender.call(abi.encodeWithSignature("receiveApproval(uint256,address)"), _value, msg.sender);
    }

    function foo12(address _spender, int[] _value) public returns (bool success) {
        // <yes> <report> SOLIDITY_WRONG_SIGNATURE ui25n6
        require(_spender.call.value(10)(bytes4((sha3("receiveApproval(address,int[],address)"))), msg.sender, _value, this));
        return true;
    }

    function foo13(address _spender, uint[] _value) public returns (bool success) {
        // <yes> <report> SOLIDITY_WRONG_SIGNATURE ui25n6
        require(_spender.call(bytes4(bytes32(keccak256("receiveApproval(address,uint[],address)"))), msg.sender, _value, this));
        return true;
    }

    function foo14(address _spender, uint256[] _value) public returns (bool success) {
        require(_spender.call(bytes4(bytes32(keccak256("receiveApproval(address,uint256[],address)"))), msg.sender, _value, this));
        return true;
    }

    function foo11(address _spender, uint[] _value) public returns (bool success) {
        // <yes> <report> SOLIDITY_WRONG_SIGNATURE rec155
        return _spender.call(abi.encodeWithSignature("receiveApproval(uint[],address)"), _value, msg.sender);
    }

    function foo11(address _spender, int256[] _value) public returns (bool success) {
        return _spender.call(abi.encodeWithSignature("receiveApproval(int256[],address)"), _value, msg.sender);
    }
}

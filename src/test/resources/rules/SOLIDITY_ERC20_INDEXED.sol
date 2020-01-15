pragma solidity 0.5.0;

contract TestToken1 is ERC20{
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    // <yes> <report> SOLIDITY_ERC20_INDEXED ac081b
    event Approval(address  _owner, address indexed _spender, uint256 _value);
    event Check(address  _owner, address indexed _spender, uint256 _value);
}

contract Test2 is ERC20Mintable{
    // <yes> <report> SOLIDITY_ERC20_INDEXED ac081b
    event Transfer(address  _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract TestToken3 is ERC20Pausable{
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    // <yes> <report> SOLIDITY_ERC20_INDEXED ac081b
    event Approval(address  _owner, address  _spender, uint256 _value);
}

contract Test4 is ERC20{
    // <yes> <report> SOLIDITY_ERC20_INDEXED ac081b
    event Transfer(address  _from, address  _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract Test5 is SafeERC20{
    // <yes> <report> SOLIDITY_ERC20_INDEXED ac081b
    event Transfer(address indexed _from, address  _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract TestToken5 is ERC20Burnable{
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract SendSomething1 {
    event Transfer(address indexed _from, uint256 _value);
}

contract SendSomething2 {
    event Transfer(address indexed _from, address indexed _to);
}

contract SendSomething3 {
    event Approval(address indexed _to);
}
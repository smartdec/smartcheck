pragma solidity ^0.4.11;

contract Owned {
    address public owner;
    address public newOwner;

    function Owned() {
        owner = msg.sender;
    }

    modifier ownerOnly {
        assert(msg.sender == owner);
        _;
    }

    function transferOwnership(address _newOwner) public ownerOnly {
        require(_newOwner != owner);
        newOwner = _newOwner;
    }


    function acceptOwnership() public {
        require(msg.sender == newOwner);
        OwnerUpdate(owner, newOwner);
        owner = newOwner;
        newOwner = 0x0;
    }

    event OwnerUpdate(address _prevOwner, address _newOwner);
}
contract SafeMath {

    function add(uint256 a, uint256 b) internal constant returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }

    function sub(uint256 a, uint256 b) internal constant returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function mul(uint256 a, uint256 b) internal constant returns (uint256) {
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

        function div(uint256 a, uint256 b) internal constant returns (uint256) {
        uint256 c = a / b;
        return c;
    }
}

contract tokenRecipient {

    function receiveApproval(address _from, uint256 _value, address _to, bytes _extraData);
}

contract ERC20Interface {

  uint256 public totalSupply;


  function balanceOf (address _owner) constant returns (uint256 balance);


  function transfer (address _to, uint256 _value) returns (bool success);


  function transferFrom (address _from, address _to, uint256 _value)
  returns (bool success);


  function approve (address _spender, uint256 _value) returns (bool success);


  function allowance (address _owner, address _spender) constant
  returns (uint256 remaining);


  event Transfer (address indexed _from, address indexed _to, uint256 _value);


  event Approval (
    address indexed _owner, address indexed _spender, uint256 _value);
}
contract HVNToken is ERC20Interface, SafeMath, Owned {

    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;
    string public constant name = "Hive Project Token";
    string public constant symbol = "HVN";
    uint8 public constant decimals = 8;
    string public version = '0.0.1';

    bool public transfersFrozen = false;

    modifier onlyPayloadSize(uint numwords) {
        assert(msg.data.length == numwords * 32 + 4);
        _;
    }


    modifier whenNotFrozen(){
        if (transfersFrozen) revert();
        _;
    }


    function HVNToken() ownerOnly {
        // send all tokens to the owner
        mint(50000000000000000);
    }

    function freezeTransfers () ownerOnly {
        if (!transfersFrozen) {
            transfersFrozen = true;
            Freeze (msg.sender);
        }
    }

    function unfreezeTransfers () ownerOnly {
        if (transfersFrozen) {
            transfersFrozen = false;
            Unfreeze (msg.sender);
        }
    }

    function transfer(address _to, uint256 _value) whenNotFrozen onlyPayloadSize(2) returns (bool success) {
        require(_to != 0x0);

        balances[msg.sender] = sub(balances[msg.sender], _value);
        balances[_to] += _value;
        Transfer(msg.sender, _to, _value);
        return true;
    }


    function transferFrom(address _from, address _to, uint256 _value) whenNotFrozen onlyPayloadSize(3) returns (bool success) {
        require(_to != 0x0);
        require(balances[_from] >= _value && allowed[_from][msg.sender] >= _value);

        balances[_from] = sub(balances[_from], _value);
        balances[_to] += _value;
        allowed[_from][msg.sender] = sub(allowed[_from][msg.sender], _value);
        Transfer(_from, _to, _value);
        return true;
    }


    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }


    function approve(address _spender, uint256 _value) onlyPayloadSize(2) returns (bool success) {
        require(_value == 0 || allowed[msg.sender][_spender] == 0);
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }


    function allowance(address _owner, address _spender) onlyPayloadSize(2) constant returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }


    function approveAndCall(address _spender, uint256 _value, bytes _extraData)  onlyPayloadSize(3) returns (bool success) {
        tokenRecipient spender = tokenRecipient(_spender);
        if (approve(_spender, _value)) {
            spender.receiveApproval(msg.sender, _value, this, _extraData);
            return true;
        }
    }


    function mint(uint256 _amount) ownerOnly {
        balances[owner] = add(balances[owner], _amount);
        totalSupply = add(totalSupply, _amount);

        Mint(owner, _amount);
        Transfer(0x0, owner, _amount);
    }


    function burn(uint256 _amount) returns (bool) {
        if (_amount > balances[msg.sender]) return false;

        balances[msg.sender] = sub(balances[msg.sender], _amount);
        totalSupply  = sub(totalSupply, _amount);

        Burn(msg.sender, _amount);
        Transfer(msg.sender, 0x0, _amount);
        return true;
    }

    function claimTokens(address _token) ownerOnly {
        if (_token == 0x0) {
            owner.transfer(this.balance);
            return;
        }

        HVNToken token = HVNToken(_token);
        uint balance = token.balanceOf(this);
        token.transfer(owner, balance);

        Transfer(_token, owner, balance);
    }


    event Freeze (address indexed owner);
    event Unfreeze (address indexed owner);
    event Mint(address indexed to, uint amount);
    event Burn(address indexed from, uint amount);
}
contract Migrations {
    address public owner;
    uint public last_completed_migration;

    modifier restricted() {
        if (msg.sender == owner) _;
    }

    function Migrations() {
        owner = msg.sender;
    }

    function setCompleted(uint completed) restricted {
        last_completed_migration = completed;
    }

    function upgrade(address new_address) restricted {
        Migrations upgraded = Migrations(new_address);
        upgraded.setCompleted(last_completed_migration);
    }
}

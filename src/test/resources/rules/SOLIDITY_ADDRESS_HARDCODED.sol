pragma solidity ^0.4.18;
contract C {
    event Transfer(address indexed s, uint amount);
    function g(address s)returns(address){
        return s;
    }
    function returnsenderbalance()  returns (uint){
    // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  adc165
        address multisig = 0xf64B584972FE6055a770477670208d737Fff282f;
        // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  adc165
        g(0x72ba7d8e73fe8eb666ea66babc8116a41bfb10e2);
        // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  b140cd
        address x = 0x123;
        // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  c67a09
        address y = 0x0;
        address myAddress = this;
        if (msg.sender != 0x0) {
            revert();
        }
    }
    function balanceOf(address _token, address _owner) public constant returns (uint) {
        uint balance = 0;
    // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  a91b18
        if (address(0) == _token) {
            balance = 12;
        }
        else if (address(balance) == _token) {
            balance = 15;
    // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  f32db1
            address s=address(342);
        }
        if (address(0) != _token) {
            balance = 122;
        }
        Transfer(0x0, balance);
    // <yes> <report> SOLIDITY_ADDRESS_HARDCODED c67a09
        address a = g(0x0);
        return balance;
    }
    modifier onlyWallet() {
        if (msg.sender != address(this))
            revert();
        _;
    }
}
contract SmartToken {
    event Transfer(address indexed s, uint amount);
    event Submission(address indexed s, address indexed s1, uint amount);
    function f1(){
        uint predecessor=0;
        Transfer(address(0),predecessor);
    // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  a91b18
        Submission(address(0), this, predecessor);
    }
}
contract Token{

}
contract Smart is Token {
    event Transfer(address indexed s, uint amount);
    event Submission(address indexed s, address indexed s1, uint amount);
    function f1(){
        uint predecessor=0;
        Transfer(address(0), predecessor);
    // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  a91b18
        Submission(address(0), msg.sender, predecessor);
    }
}
contract Smart1{
    event Transfer(address indexed s, uint amount);
    event Submission(address indexed s, address indexed s1, uint amount);
    function f2(){
    // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  a91b18
        Transfer(address(0), 4);
    // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  a91b18
        Submission(address(0), msg.sender, 4);
    }
}

pragma solidity ^0.4.16;
contract C {
    function returnsenderbalance() pure returns (uint){
    // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  adc165
        address public multisig = 0xf64B584972FE6055a770477670208d737Fff282f;
        // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  adc165
        g(0x72ba7d8e73fe8eb666ea66babc8116a41bfb10e2);
        // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  b140cd
        address x = 0x123;
        // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  c67a09
        address x = 0x0;
        address myAddress = this;
        // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  c67a09
        if (msg.sender != 0x0) {
            revert();
        }
    }
    function balanceOf(address _token, address _owner) public constant returns (uint) {
        uint balance = 0;
    // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  a91b18
        if (address(0) == _token) {
            balance = allocated[_owner].drps;
        }
    // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  f32db1
        else if (address(drpuToken[i].h()) == _token) {
            balance = allocated[_owner].drpu;
        }
        if (address(0) != _token) {
            balance = allocated[_owner].drps;
        }
        return balance;
    }
    modifier onlyWallet() {
        if (msg.sender != address(this))
            revert();
        _;
    }
}
pragma solidity ^0.4.16;

contract C {
    function returnsenderbalance() pure returns (uint){
    // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  adc165
        address public multisig = 0xf64B584972FE6055a770477670208d737Fff282f;
        // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  adc165
        g(0x72ba7d8e73fe8eb666ea66babc8116a41bfb10e2);
        // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  b140cd
        address x = 0x123;
        address myAddress = this;
    }
}
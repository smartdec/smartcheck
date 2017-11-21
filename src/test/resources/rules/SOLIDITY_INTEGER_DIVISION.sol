pragma solidity ^0.4.11;

contract SolidityUncheckedSend {
    function withdrawBalance() {
// <yes> <report> SOLIDITY_INTEGER_DIVISION 8e0621
        uint x = 5 / 2; 
    }
}

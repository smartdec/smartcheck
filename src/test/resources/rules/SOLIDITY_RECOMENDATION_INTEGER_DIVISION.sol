pragma solidity ^0.4.11;

contract SolidityUncheckedSend {
    function withdrawBalance() {
        // bad
        uint x = 5 / 2; // Result is 2, all integer divison rounds DOWN to the nearest integer

        // good
        uint multiplier = 10;
        uint x = (5 * multiplier) / 2;

        uint numerator = 5;
        uint denominator = 2;
    }
}
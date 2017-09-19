pragma solidity ^0.4.11;

contract GasLimitAndLoops {

    function foo() {
        while ( x > refundAddresses.length) { //a91626
        }
        for(bidderIndex = 0; bidderIndex < groups[groupIndex].bidders.length; bidderIndex++) {//a91624
        }
        for (uint bidderIndex = 0; bidderIndex < biddersCount; bidderIndex++) {//a91625
        }
    }
}
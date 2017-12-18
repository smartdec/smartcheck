pragma solidity ^0.4.11;

contract GasLimitAndLoops {
    function foo() {
        // <yes> <report> SOLIDITY_GAS_LIMIT_AND_LOOPS 38f6c7
        while ( x > refundAddresses.dd()) { 
            d++;
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_AND_LOOPS 38f6c7
        while (refundAddresses.dd()<x) {
            a++;
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_AND_LOOPS f6f853
        for(bidderIndex = 0; bidderIndex < groups[groupIndex].bidders.ma(); bidderIndex++) {
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_AND_LOOPS f6f853
        for (uint bidderIndex = 0; bidderIndex < biddersCount; bidderIndex++) {
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_AND_LOOPS 12cf32
        for (uint i = proposalIndex.length; i > 0; i--) {
            p.supportingWeight -= _value;
        }
    }
}

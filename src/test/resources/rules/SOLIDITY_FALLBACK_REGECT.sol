pragma solidity ^0.4.5;
contract Voting {
    function findBidder(bytes32 bidderId) constant returns (uint8 err, uint groupIndex, uint bidderIndex) {//01a1818
        for(bidderIndex = 0; bidderIndex < 34; bidderIndex++) {//нет уязвимости
        }
        return (1, 0, 0);
    }
    function findBidder(bytes32 bidderId) constant returns (uint8 err, uint groupIndex, uint bidderIndex) {//01a1818
        for(groupIndex = 0; groupIndex < groups.length; groupIndex++) {//8a1809
            for(bidderIndex = 0; bidderIndex < groups[groupIndex].bidders.length; bidderIndex++) {//8a1809
            }
        }
        return (1, 0, 0);
    }
    function () {
        return (1, 0);
    }
}
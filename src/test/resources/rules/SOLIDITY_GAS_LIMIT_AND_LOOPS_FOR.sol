pragma solidity ^0.4.5;//1a1832
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
function findBidder(uint groupIndex, bytes32 bidderId) constant returns (uint8 err, uint bidderIndex) {//01a1818
    for(bidderIndex = 0; bidderIndex < groups(length); bidderIndex++) {//8a1809
        }
    return (1, 0);
}
function refundLosingGroups(address crowdsaleAddr) {//01a1818
    // Loop all groups
    for (uint groupIndex = 0; groupIndex < groupsCount; groupIndex++) {//8a1809
        for (uint bidderIndex = 0; bidderIndex < biddersCount; bidderIndex++) {//8a1809
        }
        }
    }

}
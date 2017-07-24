pragma solidity ^0.4.5;
contract Voting {
    mapping(address => uint) voteWeight;
    address[] yesVotes;
    uint requiredWeight;
    address beneficiary;
    uint amount;-
function voteYes() { yesVotes.push(msg.sender); }
function findBidder(bytes32 bidderId) constant returns (uint8 err, uint groupIndex, uint bidderIndex) {
    for(bidderIndex = 0; bidderIndex < 34; bidderIndex++) {//нет уязвимости
        if (Utils.equal(groups[groupIndex].bidders[bidderIndex].bidderId, bidderId) == true) {
            return (0, groupIndex, bidderIndex);
        }
    }
    return (1, 0, 0);
}
function findBidder(bytes32 bidderId) constant returns (uint8 err, uint groupIndex, uint bidderIndex) {
    for(groupIndex = 0; groupIndex < groups.length; groupIndex++) {//8a1809
        for(bidderIndex = 0; bidderIndex < groups[groupIndex].bidders.length; bidderIndex++) {//8a1809
            if (Utils.equal(groups[groupIndex].bidders[bidderIndex].bidderId, bidderId) == true) {
            return (0, groupIndex, bidderIndex);
            }
        }
    }
    return (1, 0, 0);
}
function findBidder(uint groupIndex, bytes32 bidderId) constant returns (uint8 err, uint bidderIndex) {
    for(bidderIndex = 0; bidderIndex < groups[groupIndex].bidders.length; bidderIndex++) {//8a1809
        if (Utils.equal(groups[groupIndex].bidders[bidderIndex].bidderId, bidderId) == true) {
            return (0, bidderIndex);
        }
    }
    return (1, 0);
}
function refundLosingGroups(address crowdsaleAddr) {
    iCrowdsale CS = iCrowdsale(crowdsaleAddr);

    if (States(CS.getStatus()) != States.Closed) { return; }

    bytes32 currency = CS.currencySymbol();
    uint groupsCount = CS.getGroupsCount();
    uint winnerGroupIndex = CS.winnerGroupIndex();

    // Loop all groups
    for (uint groupIndex = 0; groupIndex < groupsCount; groupIndex++) {//8a1809
        uint biddersCount;
        bool hasReceivedTokensBack;
        ( , , biddersCount, , hasReceivedTokensBack) = CS.getGroup(groupIndex);

        // Check if group is not winner group and has not already been refunded
        if (groupIndex != winnerGroupIndex && hasReceivedTokensBack == false) {
        // Loop all bidders
        for (uint bidderIndex = 0; bidderIndex < biddersCount; bidderIndex++) {//8a1809
            bytes32 bidderId;
            uint bidAmount;
            bool bidderHasReceivedTokensBack;
            (bidderId, , bidAmount, bidderHasReceivedTokensBack) = CS.getGroupBidder(groupIndex, bidderIndex);

            // Check if bidder has already been refunded
            if (bidderHasReceivedTokensBack == false) {
                // Refund bidder
                _transfer(currency, LEDGER_SYSTEM_ACCOUNT, bidderId, bidAmount);

                // Save bidder refund in Crowdsale contract
                CS.setBidderHasReceivedTokensBack(groupIndex, bidderIndex);
                EventLosingGroupBidderRefunded(crowdsaleAddr, groupIndex, bidderId, currency, bidAmount);
            }
        }
    }
    }
}
}


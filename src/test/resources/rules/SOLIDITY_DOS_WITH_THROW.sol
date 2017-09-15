pragma solidity ^0.4.5;
contract Auction {
    function bid() payable {
        if (msg.value <= highestBid) { throw; }//a91620
        if (!currentLeader.send(highestBid)) { throw; } //a91620
    }
}
contract SolidityStyleGuideViolation {
     function refundAll() public {
        for(uint x; x < refundAddresses.length; x++) {//a91621
            if(refundAddresses[x].send(refunds[refundAddresses[x]])) {//a91620
                throw;
            }
        }
    }
    function refundAll1() public {
        while ( x > refundAddresses.length) {//a91622
            if(refundAddresses[x].send(refunds[refundAddresses[x]])) {//a91620
                throw;
            }
        }
    }
}
pragma solidity ^0.4.5;
contract Auction {
    address addr;
    function bid() payable {
        if (msg.value <= highestBid) { throw; }//a91620
        if (!currentLeader.send(highestBid)) { throw; } //a91620

        for(uint x; x < refundAddresses.length; x++) {//a91621
            addr.transfer(1 wei);
        }

        while ( x > refundAddresses.length) {//a91622
            refundAddresses[x].transfer(1 wei);
        }

    }
}
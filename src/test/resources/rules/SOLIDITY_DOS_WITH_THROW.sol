pragma solidity ^0.4.5;
contract Auction {
    address addr;
    function bid() payable {
        if (msg.value <= highestBid) { throw; }//637fdc
        if (!currentLeader.send(highestBid)) { revert; } //637fdc

        for(uint x; x < refundAddresses.length; x++) {//efb788
            addr.transfer(1 wei);
        }

        while ( x > refundAddresses.length) {//04242c
            refundAddresses[x].transfer(1 wei);
        }

    }
}
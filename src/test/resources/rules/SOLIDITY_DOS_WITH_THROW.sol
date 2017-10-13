pragma solidity ^0.4.5;
contract Auction {
    address addr;
    function bid() payable {
        // <yes> <report> SOLIDITY_DOS_WITH_THROW 637fdc
        if (currentLeader.send(highestBid)) { throw; }
        // <yes> <report> SOLIDITY_DOS_WITH_THROW 637fdc
        if (!currentLeader.send(highestBid)) { revert; } 

        // <yes> <report> SOLIDITY_DOS_WITH_THROW efb788
        for(uint x; x < refundAddresses[x].transfer(1 wei); x++) {
            addr.transfer(1 wei);
        }

        // <yes> <report> SOLIDITY_DOS_WITH_THROW 04242c
        while ( x > refundAddresses[x].transfer(1 wei)) {
            refundAddresses[x].transfer(1 wei);
        }
    }
}

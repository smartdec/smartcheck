pragma solidity ^0.4.5;

contract Auction {
    address currentLeader;
    uint highestBid;

    function bid() payable {
        if (msg.value <= highestBid) { throw; }

        if (!currentLeader.send(highestBid)) { throw; } // Refund the old leader, and throw if it fails

        currentLeader = msg.sender;
        highestBid = msg.value;
    }
}
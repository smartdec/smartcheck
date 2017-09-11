pragma solidity ^0.4.5;

contract Auction {
    address currentLeader;
    uint highestBid;

    function bid() payable {
        if (msg.value <= highestBid) { throw; }//a91620

        if (!currentLeader.send(highestBid)) { throw; } //a91620

        currentLeader = msg.sender;
        highestBid = msg.value;
    }
}
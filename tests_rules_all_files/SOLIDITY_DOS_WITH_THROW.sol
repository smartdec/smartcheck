pragma solidity ^0.4.5;//5a1037

contract Auction {
    address currentLeader;//8a1726
    uint highestBid;//8a1726

    function bid() payable {//8a1725
        if (msg.value <= highestBid) { throw; }//8a1139

        if (!currentLeader.send(highestBid)) { throw; } //8a1139, 5a1041

        currentLeader = msg.sender;
        highestBid = msg.value;
    }
}
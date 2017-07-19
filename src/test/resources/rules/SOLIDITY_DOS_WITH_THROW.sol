pragma solidity ^0.4.5;
contract Voting {
    function refundAll() public {
        for(uint x; x < refundAddresses.length; x++) { //8a1809
            if(refundAddresses[x].send(refunds[refundAddresses[x]])) {
            throw; //8a1139
            }
        }
    }
}

pragma solidity ^0.4.11;

contract SolidityStyleGuideViolation {
address[] private refundAddresses;
mapping (address => uint) public refunds;


function refundAll() public {
    for(uint x; x < refundAddresses.length; x++) {//a91621
    if(refundAddresses[x].send(refunds[refundAddresses[x]])) {
        throw;
    }
}
}
function refundAll1() public {
    while ( x > refundAddresses.length) {//a91622
        if(refundAddresses[x].send(refunds[refundAddresses[x]])) {
            throw;
        }
    }
}
}
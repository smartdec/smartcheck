pragma solidity ^0.4.11;

contract SolidityStyleGuideViolation {
address[] private refundAddresses;
mapping (address => uint) public refunds;


function refundAll() public {
    for(uint x; x < refundAddresses.length; x++) {
    if(refundAddresses[x].send(refunds[refundAddresses[x]])) {//a91621
        throw;
    }
}
}
function refundAll1() public {
    while ( x > refundAddresses.length) {
        if(refundAddresses[x].send(refunds[refundAddresses[x]])) {//a91622
            throw;
        }
    }
}
}
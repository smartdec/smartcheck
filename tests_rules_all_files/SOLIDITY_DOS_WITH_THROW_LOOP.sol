pragma solidity ^0.4.11;//5a1037

contract SolidityStyleGuideViolation {
address[] private refundAddresses;//8b1404
mapping (address => uint) public refunds;

// bad
function refundAll() public {//8a1725
    for(uint x; x < refundAddresses.length; x++) { //8a1600, 5a1633
    if(refundAddresses[x].send(refunds[refundAddresses[x]])) {//8a1139, 8a1532, 5a1041
        throw;
    }
}
}
function refundAll1() public {//8a1725
    while ( x > refundAddresses.length) { //8a1600
        if(refundAddresses[x].send(refunds[refundAddresses[x]])) {//8a1139, 8a1553, 5a1041
            throw;
        }
    }
}
}
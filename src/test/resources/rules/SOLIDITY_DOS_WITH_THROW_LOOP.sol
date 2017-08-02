pragma solidity ^0.4.11;//1a1832

contract SolidityStyleGuideViolation {
address[] private refundAddresses;
mapping (address => uint) public refunds;

// bad
function refundAll() public {
    for(uint x; x < refundAddresses.length; x++) { //8a1809, 2a1317
    if(refundAddresses[x].send(refunds[refundAddresses[x]])) {//1337b7, 1a1901
        throw; // doubly bad, now a single failure on send will hold up all funds
    }
}
}
function refundAll1() public {
    while ( x > refundAddresses.length) { //8a1809, 2a1347, 2a1344
        if(refundAddresses[x].send(refunds[refundAddresses[x]])) {//1337b7, 1a1901
            throw; // doubly bad, now a single failure on send will hold up all funds
        }
    }
}
}
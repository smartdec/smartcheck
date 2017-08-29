pragma solidity ^0.4.11;

contract PullPayment {
function refundAll() public {
for(uint x; x < refundAddresses.length; x++) { // arbitrary length iteration based on how many addresses participated
if(refundAddresses[x].send(refunds[refundAddresses[x]])) {
throw; // doubly bad, now a single failure on send will hold up all funds
}
}
}
}
pragma solidity ^0.4.11;

contract PullPayment {
    function withdrawPayments() {
    address payee = msg.sender;
        uint256 payment = payments[payee];
        assert(payee.call.value());//a91608
    }
}
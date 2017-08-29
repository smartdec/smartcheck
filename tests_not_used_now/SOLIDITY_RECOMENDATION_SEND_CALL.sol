pragma solidity ^0.4.11;//5a1037

contract PullPayment {//5a1547
    function withdrawPayments() {//8a1725
    address payee = msg.sender;
        uint256 payment = payments[payee];
        assert(payee.call.value());//1427c4, ca0826
    }
}
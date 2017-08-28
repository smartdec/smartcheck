pragma solidity ^0.4.11;//5a1037

contract SolidityStyleGuideViolation {

    function payOut() {//8a1725
        while (i < payees.length && msg.gas > 200000) {//8a1631
        payees[i].addr.send(payees[i].value);//1330c4, ce0826, 8a1553, 5a1041
        i++;//5a1633
        }
        nextPayeeIndex = i;
    }
}
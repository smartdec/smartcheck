pragma solidity ^0.4.11;//1a1832

contract SolidityStyleGuideViolation {

    function payOut() {//01a1818
        while (i < payees.length && msg.gas > 200000) {
        payees[i].addr.send(payees[i].value);//1a1901,1337b7
        i++;
        }
        nextPayeeIndex = i;
    }
}
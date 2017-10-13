pragma solidity ^0.4.11;

contract SolidityStyleGuideViolation {

    function payOut() {
        while (i < payees.length && msg.gas > 200000) {
        // <yes> <report> SOLIDITY_SEND 430636
        payees[i].addr.send(payees[i].value);
        i++;
        }
    }
}

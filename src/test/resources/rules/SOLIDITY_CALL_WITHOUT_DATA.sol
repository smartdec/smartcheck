pragma solidity 0.4.24;

contract CallValue {

    function withdraw1() {
    // <yes> <report> SOLIDITY_CALL_WITHOUT_DATA om991k
        if (msg.sender.call.value(1)()) {
        }
    }
    function withdraw2() {
    // <yes> <report> SOLIDITY_CALL_WITHOUT_DATA om991k
        if (msg.sender.call()) {
        }
    }
    function withdraw3() {
    // <yes> <report> SOLIDITY_CALL_WITHOUT_DATA lr991l
        if (msg.sender.call.gas(100000)()) {
        }
    }
    function withdraw4() {
        if (msg.sender.call.value(1)(3)) {
        }
    }
}

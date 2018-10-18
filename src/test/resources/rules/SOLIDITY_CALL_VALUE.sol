pragma solidity 0.4.24;

contract CallValue {

    function withdraw1() {
    /// <_yes> <report> SOLIDITY_CALL_VALUE om991k
        if (msg.sender.call.value(1)()) {
        }
    }
    function withdraw2() {
    /// <_yes> <report> SOLIDITY_CALL_VALUE om991k
        if (msg.sender.call()) {
        }
    }
    function withdraw3() {
    /// <_yes> <report> SOLIDITY_CALL_VALUE lr991l
        if (msg.sender.call.gas(100000)()) {
        }
    }
    function withdraw4() {
        if (msg.sender.call.value(1)(3)) {
        }
    }
}

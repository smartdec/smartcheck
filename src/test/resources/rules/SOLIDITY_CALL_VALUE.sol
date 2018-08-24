contract Victim {

    function withdraw() {
        /// <_yes> <report> SOLIDITY_CALL_VALUE cc2e04
        if (msg.sender.call.value(1)()) {
        }
    }
    function withdraw() {
            if (msg.sender.call.value(1)(3)) {
            }
    }
    function withdraw() {
            if (msg.sender.call.value(2)()) {
            }
    }
}

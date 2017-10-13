contract Victim {

    function withdraw() {
        // <yes> <report> SOLIDITY_CALL_VALUE cc2e04
        if (msg.sender.call.value()()) {
        }
    }
    function withdraw() {
            if (msg.sender.call.value()(3)) {
            }
        }
    function withdraw() {
            if (msg.sender.call.value(2)()) {
            }
    }

}

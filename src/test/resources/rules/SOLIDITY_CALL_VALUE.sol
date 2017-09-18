contract Victim {

    function withdraw() {
        if (msg.sender.call.value()()) {//a91606
        }
    }
    function withdraw() {
        if (msg.sender.call.value(3)()) {
        }
    }

}
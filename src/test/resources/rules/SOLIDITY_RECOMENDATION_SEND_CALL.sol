contract Victim {

    function withdraw() {
        if (msg.sender.call.value()()) {//a91608
        }
    }
    function withdraw() {
        if (msg.sender.call.value(3)()) {//a91608
        }
    }
    function withdraw() {
        if (msg.sender.call.value()(2)) {//a91608
            assert(payee.call.value()); //a91608
        }
    }
}
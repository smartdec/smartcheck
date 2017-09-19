contract Victim {

    function withdraw() {
        if (msg.sender.call.value()()) {//a91608
        }
    }

}
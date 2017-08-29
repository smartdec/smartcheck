contract Victim {
    mapping (address => uint) userbalances;

    function withdraw() {
        if (msg.sender.call.value()()) {//a91606
            userbalances[msg.sender] = 0;
        }
    }
    function withdraw() {
        if (msg.sender.call.value(3)()) {
            userbalances[msg.sender] = 0;
        }
    }
    function withdraw() {
        if (msg.sender.call.value()(2)) {
            userbalances[msg.sender] = 0;
        }
    }
    function() {
        userbalances[msg.sender] += msg.value;
    }
}
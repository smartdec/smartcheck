contract Victim {
    mapping (address => uint) userbalances;

    function withdraw() {
        if (msg.sender.call.value()()) {//8a1602//1337b7//8a1600
            userbalances[msg.sender] = 0;//8a1600
        }
    }
    function withdraw() {
        if (msg.sender.call.value(3)()) {//1337b7
            userbalances[msg.sender] = 0;//8a1600
        }
    }
    function withdraw() {
        if (msg.sender.call.value()(2)) {//1337b7
            userbalances[msg.sender] = 0;//8a1600
        }
    }
    function() {
        userbalances[msg.sender] += msg.value;
    }
}
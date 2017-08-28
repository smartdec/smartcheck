contract Victim {//5a1547
    mapping (address => uint) userbalances;//8a1726

    function withdraw() {//8a1725
        if (msg.sender.call.value()()) {//8a1602, 1427c4
            userbalances[msg.sender] = 0;
        }
    }
    function withdraw() {//8a1725
        if (msg.sender.call.value(3)()) {//1427c4
            userbalances[msg.sender] = 0;
        }
    }
    function withdraw() {//8a1725
        if (msg.sender.call.value()(2)) {//1427c4
            userbalances[msg.sender] = 0;
        }
    }
    function() {
        userbalances[msg.sender] += msg.value;//5a1633
    }
}
pragma solidity 0.4.24;

contract SoliditySend {

    function payOut() {
        uint i=50;
        while ( i < 100 && msg.gas > 200000) {
            msg.sender.send(msg.value);
            i++;
        }
// <yes> <report> SOLIDITY_SEND 430636
        if (!msg.sender.send(1)) { revert();}
// <yes> <report> SOLIDITY_SEND 430636
        if (!msg.sender.send(1)) { throw;}
// <yes> <report> SOLIDITY_SEND 430636
        require(msg.sender.send(1));
// <yes> <report> SOLIDITY_SEND 430636
        assert(msg.sender.send(1));
    }
}
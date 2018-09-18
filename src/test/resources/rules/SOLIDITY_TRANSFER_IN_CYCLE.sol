pragma solidity 0.4.24;

contract TransferInCycle {
    address[] users;
    mapping(address => uint) balances;

    function dangerousWithdraw() returns (bool) {
        uint l = users.length;
        // <yes> <report> SOLIDITY_TRANSFER_IN_CYCLE 8jdj43
        for(uint i; i < l; i++) {
            users[i].transfer(balances[users[i]]);
        }
        i=0;
        // <yes> <report> SOLIDITY_TRANSFER_IN_CYCLE 8jdj43
        while(i < l) {
            users[i].transfer(balances[users[i]]);
            i++;
        }
    }
}
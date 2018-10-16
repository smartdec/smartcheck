pragma solidity 0.4.24;

contract ERC20Token {
    function transfer(address to, uint value) returns(bool);
}

contract TransferInCycle {
    address[] users;
    mapping(address => uint) balances;

    function dangerousWithdraw() returns (bool) {
        uint l = users.length;
        // <yes> <report> SOLIDITY_TRANSFER_IN_LOOP 8jdj43
        for(uint i; i < l; i++) {
            users[i].transfer(balances[users[i]]);
        }
        i=0;
        // <yes> <report> SOLIDITY_TRANSFER_IN_LOOP 8jdj43
        while(i < l) {
            users[i].transfer(balances[users[i]]);
            i++;
        }
    }

    function goodPrictice(address token) {
        uint l = users.length;
        uint i;
        while(i < l) {
            ERC20Token(token).transfer(users[i], balances[users[i]]);
            i++;
        }
    }
}
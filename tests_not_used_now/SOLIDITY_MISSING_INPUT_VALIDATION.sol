
contract SimpleBank {
    mapping(address => uint) balances;

    function withdraw(uint amount) {
        balances[msg.sender] -= amount;
        msg.sender.transfer(amount);
    }
}

contract SimpleBank {
    mapping(address => uint) balances;

    function withdraw(uint amount) {
        require(amount <= balances[msg.sender]);
        balances[msg.sender] -= amount;
        msg.sender.transfer(amount);
    }
}
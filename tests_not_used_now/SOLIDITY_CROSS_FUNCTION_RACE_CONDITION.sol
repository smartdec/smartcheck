pragma solidity ^0.4.11;

contract PullPayment {
mapping (address => uint) private userBalances;

function transfer(address to, uint amount) {
if (userBalances[msg.sender] >= amount) {
userBalances[to] += amount;
userBalances[msg.sender] -= amount;
}
}

function withdrawBalance() public {
uint amountToWithdraw = userBalances[msg.sender];
if (!(msg.sender.call.value(amountToWithdraw)())) { throw; } // At this point, the caller's code is executed, and can call transfer()
userBalances[msg.sender] = 0;
}
}
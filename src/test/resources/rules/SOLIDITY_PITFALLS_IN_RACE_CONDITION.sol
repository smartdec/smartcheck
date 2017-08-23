contract NEW{
mapping (address => uint) private userBalances;
mapping (address => bool) private claimedBonus;
mapping (address => uint) private rewardsForA;

function withdraw(address recipient) public {
uint amountToWithdraw = userBalances[recipient];
rewardsForA[recipient] = 0;
if (!(recipient.call.value(amountToWithdraw)())) { throw; }
}

function getFirstWithdrawalBonus(address recipient) public {
if (claimedBonus[recipient]) { throw; } // Each recipient should only be able to claim the bonus once

rewardsForA[recipient] += 100;
withdraw(recipient); // At this point, the caller will be able to execute getFirstWithdrawalBonus again.
claimedBonus[recipient] = true;
}
}
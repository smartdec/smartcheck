pragma solidity ^0.4.5;
contract Voting {
    mapping(address => uint) voteWeight;
    address[] yesVotes;
    uint requiredWeight;
    address beneficiary;
    uint amount;-
function voteYes() { yesVotes.push(msg.sender); }
function tallyVotes() {
uint yesVotes;
for (uint i = 0; i < yesVotes.length; ++i)//8a1809
yesVotes += voteWeight[yesVotes[i]];
if (yesVotes > requiredWeight)
beneficiary.send(amount);
}
function tallyVotes1() {
uint yesVotes;
for (uint i = 0; i < 100; ++i)//нет ошибки
yesVotes += voteWeight[yesVotes[i]];
if (yesVotes > requiredWeight)
beneficiary.send(amount);
}
}

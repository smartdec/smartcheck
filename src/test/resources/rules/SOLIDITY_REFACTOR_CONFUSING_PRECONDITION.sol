pragma solidity ^0.4.5;
contract Voting {
function finalize() external {
    if (!isFunding) throw;
    if (msg.sender != ethFundDeposit) throw; // this locks finalize to the ultimate ETH owner
    if ((block.number <= fundingEndBlock ||//лучше разделить эти if
        totalSupply < tokenCreationMin) &&
        totalSupply < tokenCreationCap) throw;
        // move to operational
        isFunding = false;
        if(!ethFundDeposit.send(this.balance)) throw;  // send the eth to Brave International
    }
}
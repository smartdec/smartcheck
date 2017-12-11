contract Bob {
    function ping(address c) {
        if (!sent) {
            a = 4;
// <yes> <report> SOLIDITY_REENTRANCY_EXTERNAL_CALL 252f1c
            c.call.value(f(7))();
            a = 5;
        }
    }
    function ping(address c) {
        if (!sent) {
            b = 1;
// <yes> <report> SOLIDITY_REENTRANCY_EXTERNAL_CALL 252f1c
            c.call.value(4)();
// <yes> <report> SOLIDITY_REENTRANCY_EXTERNAL_CALL 252f1c
            c.call.value(4)();
            b = 1;
            c.call.value(2)();
        }
    }
    function bid() payable {
        require(msg.value > highestBid);
// <yes> <report> SOLIDITY_REENTRANCY_EXTERNAL_CALL 252f1c
        require(currentLeader.send(highestBid));
        currentLeader = msg.sender;
        highestBid = msg.value;
    }
    function bid() payable {
        require(msg.value > highestBid);
        currentLeader = msg.sender;
// <yes> <report> SOLIDITY_REENTRANCY_EXTERNAL_CALL 252f1c
        require(currentLeader.send(highestBid));
        highestBid = msg.value;
    }
    function bid() payable {
// <yes> <report> SOLIDITY_REENTRANCY_EXTERNAL_CALL 252f1c
        require(currentLeader.send(highestBid));
        currentLeader = msg.sender;
        require(msg.value > highestBid);
        highestBid = msg.value;
    }
    function bid() payable {
        currentLeader = msg.sender;
        require(msg.value > highestBid);
        highestBid = msg.value;
        require(currentLeader.send(highestBid));
    }
    function transferFrom(address _from, address _to, uint _value) public returns (bool) {
    // <yes> <report> SOLIDITY_REENTRANCY_EXTERNAL_CALL 252f1c
        bool result = super.transferFrom(_from, _to, _value);
        if (isObserver(_to)) {
            ITokenObserver(_to).notifyTokensReceived(_from, _value);
            }
        return result;
    }
    function bid() payable {
        require(currentLeader.send(highestBid));
        require(currentLeader.send(highestBid));
        require(currentLeader.send(highestBid));
    }
function propose(address _proposedAddress) public only_owner only_at_stage(Stages.Deployed) {
        require(!isProposed(_proposedAddress));
    // <yes> <report> SOLIDITY_REENTRANCY_EXTERNAL_CALL 252f1c
        balances[_to] = balances[_to].add(_value);
        Proposal storage p = proposals[_proposedAddress];
        p.createdTimestamp = now;
        p.index = proposalIndex.push(_proposedAddress) - 1;
    }
}

contract Bob1 {
    using SafeMath for uint;
    function transfer(address _to, uint256 _value) returns (bool) {
    // <yes> <report> SOLIDITY_REENTRANCY_EXTERNAL_CALL de222d
        currentLeader.send(highestBid);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        balances[_to] = balances[_to].add(_value, sum);
        Transfer(msg.sender, _to, _value);
        return true;
    }
}
contract SolidityStyleGuideViolation {

    function doSomething() {
        if (now > startTime + week) {
        g.h;
        }
    }
    function doSomething() {
        // <yes> <report> SOLIDITY_TIMESTAMP_DEPENDENCE 1955d9
        if ( startTime + week == block.timestamp) {}
        // <yes> <report> SOLIDITY_TIMESTAMP_DEPENDENCE 1955d9
        if ( startTime + week == now) {}
        if ( a == b) {}
        // <yes> <report> SOLIDITY_TIMESTAMP_DEPENDENCE cd1537
        _allocateStakeholdersTokens(totalTokenSupply * p.percentage / percentageDenominator, now + p.vestingPeriod);
        // <yes> <report> SOLIDITY_TIMESTAMP_DEPENDENCE cd1537
        if (!hasEntry(_account)) {list[_account] = Entry(now, true, listIndex.push(_account) - 1);}
        // <yes> <report> SOLIDITY_TIMESTAMP_DEPENDENCE cd1537
        time=now+8;
        time=6+7;
        require(now >= start && now <= crowdsaleEnd);
        require(now > crowdsaleEnd);
    }
}


contract C {
    function returnsenderbalance() pure returns (uint){
    // <yes> <report> SOLIDITY_TIMESTAMP_DEPENDENCE  afb67a
        d=now+1;
    }
    function GVTTeamAllocator() {
    // <yes> <report> SOLIDITY_TIMESTAMP_DEPENDENCE  afb67a
            unlockedAt = now + 12 * 30 days;
            owner = msg.sender;
            // <yes> <report> SOLIDITY_TIMESTAMP_DEPENDENCE  afb67a
            deadline = now + 24 hours;
            // <yes> <report> SOLIDITY_TIMESTAMP_DEPENDENCE  afb67a
            if (now > deadline) {
                        if (status == States.Open) {
                            status = States.Closed;
                            EventAuctionClosed(uint8(AuctionCloseReasons.DeadlineReached));
                        }
                        return true;
                    }
        }
}

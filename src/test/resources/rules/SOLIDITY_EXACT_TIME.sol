pragma solidity 0.4.24;

contract TimestampDependence {

    function doSomething() {
        uint startTime = now;
        // <yes> <report> SOLIDITY_EXACT_TIME 1955d9
        if ( startTime + 1 days == block.timestamp) {}
        // <yes> <report> SOLIDITY_EXACT_TIME 1955d9
        if ( startTime + 1 days != now) {}
        require(true == ICOisEnd(now));
        require(now >= startTime && now <= startTime + 1 days);
        require(now > startTime + 1 days);
    }

    function ICOisEnd(uint _time) returns(bool) {
        return _time > 1000000000;
    }
}
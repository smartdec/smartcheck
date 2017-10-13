contract SolidityStyleGuideViolation {

    function doSomething() {
        // <yes> <report> SOLIDITY_TIMESTAMP_DEPENDENCE 1955d9
        if (now > startTime + week) {
        }
    }

    function doSomething() {
        // <yes> <report> SOLIDITY_TIMESTAMP_DEPENDENCE da0c53
        if ( startTime + week == block.timestamp) {}
    }

}

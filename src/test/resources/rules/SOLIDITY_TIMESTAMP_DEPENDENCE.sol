contract SolidityStyleGuideViolation {

    function doSomething() {
        if (now > startTime + week) {
        }
    }

    function doSomething() {
        // <yes> <report> SOLIDITY_TIMESTAMP_DEPENDENCE 1955d9
        if ( startTime + week == block.timestamp) {}
    }

}

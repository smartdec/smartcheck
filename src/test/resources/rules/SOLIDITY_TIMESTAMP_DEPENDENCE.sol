contract SolidityStyleGuideViolation {

    function doSomething() {
        if (now == startTime + week) {//a91623
        }
    }

    function doSomething() {
        if ( startTime + week == block.timestamp) {//a01623
        }
    }

}
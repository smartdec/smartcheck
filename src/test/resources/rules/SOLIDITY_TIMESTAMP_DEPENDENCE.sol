contract SolidityStyleGuideViolation {

    event badlyNamedEvent();
    function BadlyNamedFunction() returns (bool) {
        return true;
    }

    function okFunction() {}
    event OkEvent();

    function doSomething() {
        if (now > startTime + week) {//a91623
        badlyNamedEvent();
        }
    }

}
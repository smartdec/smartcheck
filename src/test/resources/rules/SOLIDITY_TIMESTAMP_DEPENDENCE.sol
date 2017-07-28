contract SolidityStyleGuideViolation {

    event badlyNamedEvent();//67c4ca
    function BadlyNamedFunction() returns (bool) {//4fc198
        return true;
    }

    function okFunction() {}
    event OkEvent();

    function doSomething() {
        if (now > startTime + week) {//8a1518
        badlyNamedEvent();
        }
    }

}
contract SolidityStyleGuideViolation {//5a1547

    event badlyNamedEvent();//67c4ca
    function BadlyNamedFunction() returns (bool) {//4fc198
        return true;
    }

    function okFunction() {}//8a1725
    event OkEvent();

    function doSomething() {//8a1725
        if (now > startTime + week) {//8a1556, 5a1633
        badlyNamedEvent();
        }
    }

}
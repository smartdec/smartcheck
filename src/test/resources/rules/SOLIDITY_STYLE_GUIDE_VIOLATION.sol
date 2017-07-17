pragma solidity ^0.4.11;

contract SolidityStyleGuideViolation {
    
    event badlyNamedEvent();
    function BadlyNamedFunction() returns (bool) {
        return true;
    }
    
    function okFunction() {}
    event OkEvent();
    
    function doSomething() {
        if (BadlyNamedFunction()) {
            badlyNamedEvent();
        }
    }
    
}

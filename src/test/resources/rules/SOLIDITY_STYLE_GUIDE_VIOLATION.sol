pragma solidity ^0.4.11;

contract SolidityStyleGuideViolation {
    
    event badlyNamedEvent();//343033
    function BadlyNamedFunction() returns (bool) {//b0dbcd
        return true;
    }
    
    function okFunction() {}
    function SolidityStyleGuideViolation() {}
    event OkEvent();
    
    function doSomething() {
        if (BadlyNamedFunction()) {
            badlyNamedEvent();
        }
    }
    
}
contract SolidityStyleGuideViolation {
    function DoSomething() {}//b0dbcd
}
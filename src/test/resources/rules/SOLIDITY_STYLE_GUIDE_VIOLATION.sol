pragma solidity ^0.4.11;

contract SolidityStyleGuideViolation {
    
    // <yes> <report> SOLIDITY_STYLE_GUIDE_VIOLATION 343033
    event badlyNamedEvent();
    // <yes> <report> SOLIDITY_STYLE_GUIDE_VIOLATION b0dbcd
    function BadlyNamedFunction() returns (bool) {
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
    // <yes> <report> SOLIDITY_STYLE_GUIDE_VIOLATION b0dbcd
    function DoSomething() {}
}

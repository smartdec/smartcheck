pragma solidity ^0.4.11;

contract SolidityStyleGuideViolation {
    
    event badlyNamedEvent();//a91613
    function BadlyNamedFunction() returns (bool) {//a91614
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

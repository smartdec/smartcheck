pragma solidity ^0.4.11;//5a1037

contract SolidityStyleGuideViolation {//5a1547
    
    event badlyNamedEvent();//67c4ca
    function BadlyNamedFunction() returns (bool) {//4fc198, 8a1725
        return true;
    }
    
    function okFunction() {}//8a1725
    event OkEvent();
    
    function doSomething() {//8a1725
        if (BadlyNamedFunction()) {
            badlyNamedEvent();
        }
    }
    
}

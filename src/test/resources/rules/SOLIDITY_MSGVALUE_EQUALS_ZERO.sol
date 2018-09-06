pragma solidity 0.4.24;

contract MsgValue {

    constructor() public {
        require(msg.value == 0);
    }

    function myFunc() public returns(uint) {
        // <yes> <report> SOLIDITY_MSGVALUE_EQUALS_ZERO 1df89a
        require(msg.value == 0);
        // <yes> <report> SOLIDITY_MSGVALUE_EQUALS_ZERO 1df89a
        if(msg.value == 0) {
            return(1);
        }
        // <yes> <report> SOLIDITY_MSGVALUE_EQUALS_ZERO 1df89a
        assert(msg.value == 0);
    }

    function() {
        // <yes> <report> SOLIDITY_MSGVALUE_EQUALS_ZERO 1df89a
        require(msg.value == 0);
    }
}

contract MsgValue2 {

    function MsgValue2() {
        require(msg.value == 0);
    }
}
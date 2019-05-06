pragma solidity ^0.4.11;

contract SolidityVarZero {
    function foo1() {
        // <yes> <report> SOLIDITY_VAR d28aa7
        for (var i = 0; i < a.length; i ++) { a[i] = i; }
    }
    function foo2() {
        for (uint16 i = 0; i < a.length; i ++) { a[i] = i; }
    }
    function foo3() {
        // <yes> <report> SOLIDITY_VAR f77619
        var a;
        // <yes> <report> SOLIDITY_VAR d28aa7
        var minIdx = 0; /* inferred to uint8 */
        for (var i = minIdx; i < a.length; i++) { a[i] = i; }

    }
}

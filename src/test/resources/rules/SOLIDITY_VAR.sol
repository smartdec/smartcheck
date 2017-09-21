pragma solidity ^0.4.11;

contract SolidityVarZero {
    function foo1() {
        for (var i = 0; i < a.length; i ++) { a[i] = i; }//d28aa7
    }
    function foo2() {
        for (uint16 i = 0; i < a.length; i ++) { a[i] = i; }
    }
    var minIdx = 0; /* inferred to uint8 */
    function foo3() {
    	for (var i = minIdx; i < a.length; i++) { a[i] = i; }//f77619

    }
}
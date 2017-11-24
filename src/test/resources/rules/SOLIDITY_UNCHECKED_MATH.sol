pragma solidity ^0.4.16;

contract C {
    function f(){
// <yes> <report> SOLIDITY_UNCHECKED_MATH 87b5ac
        x = a * (b + c);
// <yes> <report> SOLIDITY_UNCHECKED_MATH 87b5ac
        if (a < b + c) foo();
// <yes> <report> SOLIDITY_UNCHECKED_MATH 87b5ac
         else if (a < d * e) bar();
// <yes> <report> SOLIDITY_UNCHECKED_MATH 87b5ac
         c / a =b;
         for (uint i=0;i<10;i++){
            a=0;
         }
    }
}

pragma solidity 0.4.16;

contract C {
  function f(uint a, uint b, uint c, uint d, uint e){
// <yes> <report> SOLIDITY_UNCHECKED_MATH 50dc28 <yes> <report> SOLIDITY_UNCHECKED_MATH 7dc23a
        d = a * (b + c);
// <yes> <report> SOLIDITY_UNCHECKED_MATH 50dc28
        if (a < b + c) foo(a);
        if (a < b + 10) foo(a);
// <yes> <report> SOLIDITY_UNCHECKED_MATH 50dc28
        for (uint j=0;i<100;j++){
// <yes> <report> SOLIDITY_UNCHECKED_MATH 50dc28
        a+=b;
        }
// <yes> <report> SOLIDITY_UNCHECKED_MATH 7dc23a
        if (a < d*e) foo(a);
// <yes> <report> SOLIDITY_UNCHECKED_MATH 7dc23a
        d=a**100;
// <yes> <report> SOLIDITY_UNCHECKED_MATH 7dc23a
        b*=a;
// <yes> <report> SOLIDITY_UNCHECKED_MATH 87b5ac
        b=c/a;
// <yes> <report> SOLIDITY_UNCHECKED_MATH 87b5ac
        b=c-a;
// <yes> <report> SOLIDITY_UNCHECKED_MATH 87b5ac
        b-=d;
// <yes> <report> SOLIDITY_UNCHECKED_MATH 87b5ac
        for (uint i=10;i>1;i--){
// <yes> <report> SOLIDITY_UNCHECKED_MATH 87b5ac
            a/=c;
        }
    }
    function foo(uint a) constant returns (uint){
        return a;
    }
}

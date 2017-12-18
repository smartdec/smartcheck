pragma solidity ^0.4.18;

contract StandardToken{
 // <yes> <report> SOLIDITY_NO_PAYABLE_FALLBACK 86c34a
     function () {
         uint a=1;
     }
 }
contract StandardToken{
// <yes> <report> SOLIDITY_NO_PAYABLE_FALLBACK 70ac56
    function f() {
        throw;
    }
}
// <yes> <report> SOLIDITY_NO_PAYABLE_FALLBACK 12fa3c
contract ERC20Token is StandardToken {
    function () {
        throw;
    }
}
interface ERC20Token1{
// <yes> <report> SOLIDITY_NO_PAYABLE_FALLBACK 86c34a
    function ();
}
interface ERC20Token1{
// <yes> <report> SOLIDITY_NO_PAYABLE_FALLBACK 70ac56
    function f() payable;
}
contract ERC20Token2{
// <yes> <report> SOLIDITY_NO_PAYABLE_FALLBACK 86c34a
    function () {
        throw;
    }
}
contract ERC20Token2{
// <yes> <report> SOLIDITY_NO_PAYABLE_FALLBACK 12fa3c
    function () {
        throw;
    }
}
contract ERC20Token2{
// <yes> <report> SOLIDITY_NO_PAYABLE_FALLBACK 70ac56
    function f() payable{
        if (msg.sender==0x0) throw;
    }
}
library ERC20Token2{
    function f() payable{
        if (msg.sender==0x0) throw;
    }
}
library ERC20Token2{
    function f() {
        if (msg.sender==0x0) throw;
    }
}
library ERC20Token2{
    function f() {
        throw;
    }
}
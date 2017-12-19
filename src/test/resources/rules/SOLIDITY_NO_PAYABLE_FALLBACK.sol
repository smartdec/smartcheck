pragma solidity ^0.4.18;
contract StandardToken{
 // <yes> <report> SOLIDITY_NO_PAYABLE_FALLBACK 86c34a
     function () {
         uint a=1;
     }
 }
// <yes> <report> SOLIDITY_NO_PAYABLE_FALLBACK 70ac56
contract StandardToken{
    function f() {
        throw;
    }
}
contract ERC20Token is StandardToken {
// <yes> <report> SOLIDITY_NO_PAYABLE_FALLBACK 12fa3c <yes>
    function () payable{
        throw;
    }
}
interface ERC20Token1{
// <yes> <report> SOLIDITY_NO_PAYABLE_FALLBACK 86c34a
    function ();
}
interface ERC20Token1{
    function f() payable;
}
contract ERC20Token2{
// <yes> <report> SOLIDITY_NO_PAYABLE_FALLBACK 86c34a
    function () {
        throw;
    }
}
contract ERC20Token2{
//<yes> <report> SOLIDITY_NO_PAYABLE_FALLBACK 12fa3c
    function () payable{
        throw;
    }
}
// <yes> <report> SOLIDITY_NO_PAYABLE_FALLBACK 70ac56
contract ERC20Token2{
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
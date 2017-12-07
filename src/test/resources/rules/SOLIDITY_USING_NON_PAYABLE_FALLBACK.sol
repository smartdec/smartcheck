pragma solidity ^0.4.18;
contract StandardToken{
// <yes> <report> SOLIDITY_USING_NON_PAYABLE_FALLBACK 86c34a
    function () {
        throw;
    }
    function f1() payable {
        revert();
    }
}
// <yes> <report> SOLIDITY_USING_NON_PAYABLE_FALLBACK 70ac56
contract ERC20Token is StandardToken {
    function f() {
        throw;
    }
}
contract ERC20Token1{
// <yes> <report> SOLIDITY_USING_NON_PAYABLE_FALLBACK 12fa3c
    function () payable{
        throw;
    }
}
contract ERC20Token2{
    function () payable{
        if (msg.sender==0x0) throw;
    }
}
contract ERC20Token3{
    function () payable {
        revert();
    }
}
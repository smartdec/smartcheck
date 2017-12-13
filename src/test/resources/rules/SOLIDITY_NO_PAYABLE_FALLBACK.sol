pragma solidity ^0.4.18;

contract StandardToken{
// <yes> <report> SOLIDITY_NO_PAYABLE_FALLBACK 86c34a
    function () {
        throw;
    }
    function f1() payable {
        return a;
    }
}
// <yes> <report> SOLIDITY_NO_PAYABLE_FALLBACK 70ac56
contract ERC20Token is StandardToken {
    function f() {
        throw;
    }
}
contract ERC20Token1{
// <yes> <report> SOLIDITY_NO_PAYABLE_FALLBACK 12fa3c
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
// <yes> <report> SOLIDITY_NO_PAYABLE_FALLBACK 12fa3c
    function () payable {
        revert();
    }
}
library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }
}
contract ERC20Token is StandardToken {
// <yes> <report> SOLIDITY_USING_NON_PAYABLE_FALLBACK 86c34a
    function () {
        throw;
    }
    function () payable {
        revert();
    }
}
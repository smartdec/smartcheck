pragma solidity 0.4.8;

contract TestContract1 {
    // <yes> <report> SOLIDITY_REDUNDANT_FALLBACK_REJECT b85a32
    function() payable {
        throw;
    }
}

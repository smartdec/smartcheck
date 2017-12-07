pragma solidity ^0.4.18;
library GetCode {
    function at( address _addr) returns (bytes o_code) {
    // <yes> <report> SOLIDITY_USING_INLINE_ASSEMBLY 109cd5
        assembly {
            let size := extcodesize(_addr)
            o_code := mload(0x40)
            mstore(0x40, add(o_code, and(add(add(size, 0x20), 0x1f), not(0x1f))))
            mstore(o_code, size)
            extcodecopy(_addr, add(o_code, 0x20), 0, size)
        }
    }
    function isContract(address addr) private returns (bool) {
        uint _size;
        assembly { _size := extcodesize(addr) }
        return _size > 0;
    }
}
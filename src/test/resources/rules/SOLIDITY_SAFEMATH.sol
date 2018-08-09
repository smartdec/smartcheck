pragma solidity 0.4.24;

library SafeMath {
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }
}

contract MyToken {
    // <yes> <report> SOLIDITY_SAFEMATH 837cac
    using SafeMath for uint256;

    function sub(uint a, uint b) public returns(uint) {
        return(a.sub(b));
    }
}
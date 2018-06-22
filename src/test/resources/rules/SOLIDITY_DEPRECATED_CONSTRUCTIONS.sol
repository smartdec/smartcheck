pragma solidity 0.4.24;

contract C {
	function kill() onlyOwner{
        // <yes> <report> SOLIDITY_DEPRECATED_CONSTRUCTIONS  27cb59
        suicide(owner);
    }

}
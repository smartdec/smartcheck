pragma solidity 0.4.8;

contract TestContract1 {
    function() payable {//a91640
        throw;
    }
}
/*
 Counter-example
 Commented out: can't contain >1 pragma in a file
pragma solidity 0.3.8;
contract TestContract2 {
    function() public payable {
        throw;
    }
}
*/
pragma solidity ^0.4.19;

contract SolidityVisibility1 {

// <yes> <report> SOLIDITY_VISIBILITY b51ce0
    uint x;
    uint private y;

// <yes> <report> SOLIDITY_VISIBILITY 910067
    function transfer() {
        x=0;
    }

    function isServer(address sender) public constant returns (bool) {
        return sender == msg.sender;
    }

    function transfernew() external {
    }

    function internalAction() internal {
    }

// <yes> <report> SOLIDITY_VISIBILITY d67c21
    function () private {
    }
}

contract SolidityVisibility2 {

// <yes> <report> SOLIDITY_VISIBILITY 910067
    function AccessManager(address _server, address _guardian) returns(address){
        return _server;
    }

// <yes> <report> SOLIDITY_VISIBILITY d67c21
    function () {
    }
}

interface SolidityVisibility3 {

// <yes> <report> SOLIDITY_VISIBILITY 910067
    function noVisibility1 ();

// <yes> <report> SOLIDITY_VISIBILITY 23rt6g
    function noVisibility2 () public;

    function noVisibility2 () external;

    function () external;

} 

interface SolidityVisibility4 {

/* <yes> <report> SOLIDITY_VISIBILITY 23rt6g*/
// <yes> <report> SOLIDITY_VISIBILITY d67c21
    function ();
} 

library LibraryVisibility {
// <yes> <report> SOLIDITY_VISIBILITY 910067
    function noVisibility () {
    }

    function withVisibility () public {
    }
}





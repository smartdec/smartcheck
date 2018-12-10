pragma solidity 0.4.23;

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

    function transfernew2() private {
    }

    function internalAction() internal {
    }

// <yes> <report> SOLIDITY_VISIBILITY d67c21
    function () private {
    }
}


contract SolidityVisibility2 {

// <yes> <report> SOLIDITY_VISIBILITY 910067
    constructor () {
        address owner = msg.sender;
    }
// <yes> <report> SOLIDITY_VISIBILITY 321aca
    constructor () external {
        address owner = msg.sender;
    }
// <yes> <report> SOLIDITY_VISIBILITY 321aca
    constructor () private {
        address owner = msg.sender;
    }
// <yes> <report> SOLIDITY_VISIBILITY 910067
    function AccessManager(address _server, address _guardian) returns(address){
        return _server;
    }

// <yes> <report> SOLIDITY_VISIBILITY 910067
    function () {
    }
}


interface SolidityVisibility3 {

// <yes> <report> SOLIDITY_VISIBILITY 910067
    function noVisibility1 ();

// <yes> <report> SOLIDITY_VISIBILITY 23rt6g
    function noVisibility2 () public;

// <yes> <report> SOLIDITY_VISIBILITY 23rt6g
    function noVisibility3 () private;

// <yes> <report> SOLIDITY_VISIBILITY 23rt6g
    function noVisibility4 () internal;

    function noVisibility5 () external;

    function () external;

} 


contract SolidityVisibility4 {

    function () public {
    }
}


contract SolidityVisibility5 {

    function () external {
    }
}


contract SolidityVisibility6 {

// <yes> <report> SOLIDITY_VISIBILITY d67c21
    function () internal {
    }
}

interface SolidityVisibility7 {
// <yes> <report> SOLIDITY_VISIBILITY 23rt6g
    function () public;
} 


interface SolidityVisibility8 {
// <yes> <report> SOLIDITY_VISIBILITY 910067
    function ();
} 


interface SolidityVisibility9 {
// <yes> <report> SOLIDITY_VISIBILITY 23rt6g
    function () private;
} 


library LibraryVisibility {
// <yes> <report> SOLIDITY_VISIBILITY 910067
    function noVisibility () {
    }

    function withVisibility () public {
    }
}
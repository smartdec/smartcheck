pragma solidity ^0.4.19;

contract SolidityVisibility1 {

// <yes> <report> SOLIDITY_VISIBILITY b51ce0
    uint x;
// <yes> <report> SOLIDITY_VISIBILITY 910067
    function transfer() {
        x=0;
    }
   function isServer(address sender) public constant returns (bool) {
        return sender == msg.sender;
   }
   uint private y;
   function transfernew() external {
   }
   function internalAction() internal {
   }
   function () private {
   }
}
contract SolidityVisibility2 {

// <yes> <report> SOLIDITY_VISIBILITY 910067
    function AccessManager(address _server, address _guardian) returns(address){
        return _server;
    }
// <yes> <report> SOLIDITY_VISIBILITY d67c21
    function (){
    }
}
pragma solidity ^0.4.11;

contract SolidityUncheckedSend {
    function veryDangerousSend(address _to) returns (bool) {
        for (var i = 0; i < a.length; i ++) { a[i] = i; }//a91615
    }
    function veryDangerousSend(address _to) returns (bool) {
        for (uint16 i = 0; i < a.length; i ++) { a[i] = i; }
    }
}
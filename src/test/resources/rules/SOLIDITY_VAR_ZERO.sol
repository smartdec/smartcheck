pragma solidity ^0.4.11;

contract SolidityUncheckedSend {
    function veryDangerousSend(address _to) returns (bool) {
        for (var i = 0; i < a.length; i ++) { a[i] = i; }//8a1549
    }
    function veryDangerousSend(address _to) returns (bool) {
        for (var i = 1; i < a.length; i ++) { a[i] = i; }//нет ошибки
    }
}
pragma solidity ^0.4.11;

contract SolidityUncheckedSend {
// <yes> <report> SOLIDITY_IS_IT_VIEW_FUNCTIONS ad1827
        function unseatKing(address a, uint w) returns (uint){
            x.job(10);
        }
        function unseatKing(address a, uint w) view returns (uint){
            x.job(10);
        }
        function unseatKing(address a, uint w) returns (uint){
            x.transfer(10);
        }
}
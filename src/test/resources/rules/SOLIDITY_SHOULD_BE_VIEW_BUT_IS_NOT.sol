pragma solidity ^0.4.11;

contract SolidityUncheckedSend {
// <_yes> <report> SOLIDITY_SHOULD_BE_VIEW_BUT_IS_NOT ad1827
        function unseatKing(address a, uint w) returns (uint){
            x.job(10);
        }
        function unseatKing(address a, uint w) constant{
            x.job(10);
        }
        function unseatKing(address a, uint w) view returns (uint){
            x.job(10);
        }
        function unseatKing(address a, uint w) returns (uint){
            x.transfer(10);
        }
        function balanceOf(address who) returns (uint256);
}
contract SolidityUncheckedSendNew {
        function SolidityUncheckedSendNew(address a, uint w) returns (uint){
            x.job(10);
        }
}
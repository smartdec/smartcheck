pragma solidity ^0.4.11;

contract SolidityUncheckedSend {
    function(){
    a=0;
    uint x = 5 / a;//плохо
    if (a!=0){
            uint b=1/a;//хорошо
        }
    }
}
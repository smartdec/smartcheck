pragma solidity ^0.4.5;
contract Voting {
    function p4 () returns ( uint ){
        uint sum = 0;
       for ( uint i = 1 ; i <= 100 ; i++) sum+=i;
    return sum;
    }
}
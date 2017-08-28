pragma solidity ^0.4.5;
contract Voting {
    uint sum= 0;
    function p3 ( uint x ){
        for ( uint i = 0 ; i< x ; i ++){
            sum+=i;
        }
    }
}

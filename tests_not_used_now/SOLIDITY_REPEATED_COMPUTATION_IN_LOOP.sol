pragma solidity ^0.4.5;
contract Voting {
    uint x=1;
    uint y=2;
    function p(uint k){
        uint sum=0;
        for(uint i=1;i<=k;i++) sum=sum+x+y;
    }
}

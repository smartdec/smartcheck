library x{//a91635
    function foo();
}
contract Ballot {
    function y(){
        x(0).foo();
    }
}
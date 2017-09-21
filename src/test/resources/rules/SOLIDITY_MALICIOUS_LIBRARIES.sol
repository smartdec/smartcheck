library x{//a0298c
    function foo();
}
contract Ballot {
    function y(){
        x(0).foo();
    }
}
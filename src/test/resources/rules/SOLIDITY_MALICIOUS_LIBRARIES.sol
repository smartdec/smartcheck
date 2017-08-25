library x{
    function foo();
}
contract Ballot {
    function y(){
        x(0).foo();
    }
}
// <yes> <report> SOLIDITY_MALICIOUS_LIBRARIES a0298c
library x{
    function foo();
}
contract Ballot {
    function y(){
        x(0).foo();
    }
}

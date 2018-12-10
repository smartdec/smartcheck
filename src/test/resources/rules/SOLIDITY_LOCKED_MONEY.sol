pragma solidity 0.4.24;

contract GoodMarketPlace {

    function kill() public {
        suicide(msg.sender);
    }
}

contract GoodMarketPlace1 {

    function kill() payable {
        selfdestruct(msg.sender);
    }
}

contract GoodMarketPlace2 {

    address x;
    address myAddress;
    function someComp() payable{
        if (x.balance < 10 && myAddress.balance >= 10) x.send(10);
    }
}

contract GoodMarketPlace3 {

    uint a;
    function deposit(address w){
        w.transfer(9);
    }
    function deposit1() payable {}
    function foo() {a=0;}
}

// <yes> <report> SOLIDITY_LOCKED_MONEY 30281d
contract GoodMarketPlace5 {

    function deposit() payable {}
    function foo() {}
}

contract GoodMarketPlace6 {

    address s;
    function deposit() payable {}
    function foo(uint amount) payable {
        s.call.value(amount)();
    }
}

// <yes> <report> SOLIDITY_LOCKED_MONEY 30281d
contract GoodMarketPlace7 {

     function() payable {}
}

// <yes> <report> SOLIDITY_LOCKED_MONEY 30281d
contract GoodMarketPlace8 {

    function() payable {}
}

library BadMarketPlace1 {

    function foo() {}
}
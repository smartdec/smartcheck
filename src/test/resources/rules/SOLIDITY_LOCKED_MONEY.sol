
contract GoodMarketPlace1 {
    function kill() public {
        suicide(msg.sender);
    }
}

contract GoodMarketPlace2 {
    function someComp() {
        if (x.balance < 10 && myAddress.balance >= 10) x.send(10);
    }
}

contract GoodMarketPlace3 {
    function kill() public {
        suicide(msg.sender);
    }
}

contract BadMarketPlace {//a91636
    function someComp() {
        if (x.balance < 10 && myAddress.balance >= 10) x.call(10);
    }
}
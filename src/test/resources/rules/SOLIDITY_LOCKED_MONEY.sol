//GOOD
contract MarketPlace {
    function someComp() {
        if (x.balance < 10 && myAddress.balance >= 10) x.transfer(10);
    }

    function kill() public {
        suicide(msg.sender);
    }
}
//GOOD
contract MarketPlace {
    function someComp() {
        if (x.balance < 10 && myAddress.balance >= 10) x.send(10);
    }

    function kill() public {
        suicide(msg.sender);
    }
}
//GOOD
contract MarketPlace {
    function someComp() {
        if (x.balance < 10 && myAddress.balance >= 10) x.send(10);
    }
}
//GOOD
contract MarketPlace {
    function kill() public {
        suicide(msg.sender);
    }
}
//GOOD
contract MarketPlace {
    function someComp() {
        if (x.balance < 10 && myAddress.balance >= 10) x.transfer(10);
    }
}
//Bad
contract MarketPlace {
    function kill() public {
        suicide(msg.sender);
    }
}
//Bad
contract MarketPlace {
    function someComp() {
        if (x.balance < 10 && myAddress.balance >= 10) x.transfer(10);
    }
}

contract MarketPlace {
    function someComp() {//8a1725
        if (x.balance < 10 && myAddress.balance >= 10) x.transfer(10);
    }

    function kill() public {//8a1725
        suicide(msg.sender);
    }
}

contract MarketPlace {
    function someComp() {//8a1725
        if (x.balance < 10 && myAddress.balance >= 10) x.send(10);//5a1041
    }

    function kill() public {//8a1725
        suicide(msg.sender);
    }
}

contract MarketPlace {
    function someComp() {//8a1725
        if (x.balance < 10 && myAddress.balance >= 10) x.send(10);//5a1041
    }
}

contract MarketPlace {
    function kill() public {//8a1725
        suicide(msg.sender);
    }
}

contract MarketPlace {
    function someComp() {//8a1725
        if (x.balance < 10 && myAddress.balance >= 10) x.transfer(10);
    }
}


contract MarketPlace {//5a1547
    function someComp() {//8a1725
        if (x.balance < 10 && myAddress.balance >= 10) x.call(10);
    }
}
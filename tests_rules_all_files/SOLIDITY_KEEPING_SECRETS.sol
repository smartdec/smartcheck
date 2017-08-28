contract MarketPlace {
    function someComp() {//8a1725
        if (x.balance < 10 && myAddress.balance >= 10) x.transfer(10);
    }

    function kill() private {//8a1725, 8b1404
        suicide(msg.sender);
    }
}
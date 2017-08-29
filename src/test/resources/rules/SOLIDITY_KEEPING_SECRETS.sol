contract MarketPlace {
    function someComp() {
        if (x.balance < 10 && myAddress.balance >= 10) x.transfer(10);
    }

    function kill() private {//a91641
        suicide(msg.sender);
    }
}
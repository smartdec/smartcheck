//BAD
contract MarketPlace {
    function transfer() {
        uint x = msg.value;
    }
}
//GOOD
contract MarketPlace {
    function someComp() {
        uint x = msg.value;
    }

    function kill() public {
        suicide(msg.sender);
    }
}
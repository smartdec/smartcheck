contract Auction {
    address currentLeader;
    uint highestBid;

    function bid() payable {
        require(msg.value > highestBid);
        // <yes> <report> SOLIDITY_DOS_WITH_REVERT 15ac23
        require(currentLeader.send(highestBid));
        currentLeader = msg.sender;
        highestBid = msg.value;
    }

    function bid() payable {
        require(msg.value > highestBid);
        currentLeader.give(highestBid);
        currentLeader = msg.sender;
        highestBid = msg.value;
    }

    modifier only_token_holder() {
        // <yes> <report> SOLIDITY_DOS_WITH_REVERT 15ac23
        require(allocated[msg.sender].drps > 0 || allocated[msg.sender].drpu > 0);
        _;
    }

    modifier only_token_holder2() {
        // <yes> <report> SOLIDITY_DOS_WITH_REVERT 15ac23
        assert(allocated[msg.sender].drps > 0 || allocated[msg.sender].drpu > 0);
        _;
    }
}

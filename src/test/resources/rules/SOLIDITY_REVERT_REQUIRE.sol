contract f{
    function a(){
    // <yes> <report> SOLIDITY_REVERT_REQUIRE c56b12
        if (x>y) { revert(); }
    }
    modifier atStage(Stages _stage) {
    // <yes> <report> SOLIDITY_REVERT_REQUIRE c56b12
        if (stage != _stage)
            revert();
        _;
    }
}
contract f{
    function a(){
    // <yes> <report> SOLIDITY_REVERT_REQUIRE c56b12
        if (x>y) { throw; }
        if (tokensToSend > 0) {
            allocatedTokens -= tokensToSend;
    // <yes> <report> SOLIDITY_REVERT_REQUIRE c56b12
            if (!token.issue(msg.sender, tokensToSend)) {
                revert();
            }
        }
        if (ethToSend > 0) {
            allocatedEth -= ethToSend;
    // <yes> <report> SOLIDITY_REVERT_REQUIRE c56b12
            if (!msg.sender.send(ethToSend)) {
                revert();
            }
        }
        if (stage == Stages.PresaleStarted) {
            buyPresale(receiver);
        }
    // <yes> <report> SOLIDITY_REVERT_REQUIRE c56b12
        else if (stage == Stages.MainSaleStarted) {
            buyMainSale(receiver);
        } else {
            revert();
        }
    // <yes> <report> SOLIDITY_REVERT_REQUIRE c56b12
        if(!ico_ended) {
           eth_received = Add(eth_received, msg.value);
        } else {
           revert();
        }
    }
}
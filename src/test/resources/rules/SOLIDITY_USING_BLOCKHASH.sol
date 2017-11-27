contract BlockHashTest{
    function getBlockHash(uint64 blockNumber) constant returns (bytes32 blockHash){
    // <yes> <report> SOLIDITY_USING_BLOCKHASH b629ad
        d = c.blockhash(blockNumber);
    // <yes> <report> SOLIDITY_USING_BLOCKHASH b629ad
        return block.blockhash(blockNumber);
    }
}
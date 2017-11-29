pragma solidity 0.4.16;
contract BlockHashTest{
    function getBlockHash(uint64 blockNumber) constant returns (bytes32 blockHash){
// <yes> <report> SOLIDITY_USING_BLOCKHASH b629ad
        return block.blockhash(blockNumber);
    }
}
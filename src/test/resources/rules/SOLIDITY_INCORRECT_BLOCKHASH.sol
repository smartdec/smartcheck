pragma solidity 0.4.24;

contract BlockHash{
    function getBlockBlockhash(uint64 blockNumber) constant returns (bytes32 blockhash){
        // <yes> <report> SOLIDITY_INCORRECT_BLOCKHASH b629ad
        block.blockhash(100);
        // <yes> <report> SOLIDITY_INCORRECT_BLOCKHASH b629ad
        block.blockhash(block.number);
        // <yes> <report> SOLIDITY_INCORRECT_BLOCKHASH b629ad
        block.blockhash(block.number-257);
        block.blockhash(block.number-256);
    }

    function getBlockhash(uint64 blockNumber) constant returns (bytes32 blockhash){
        // <yes> <report> SOLIDITY_INCORRECT_BLOCKHASH b629ad
        blockhash(100);
        // <yes> <report> SOLIDITY_INCORRECT_BLOCKHASH b629ad
        blockhash(block.number);
        // <yes> <report> SOLIDITY_INCORRECT_BLOCKHASH b629ad
        blockhash(block.number-257);
        blockhash(block.number-256);
    }
}
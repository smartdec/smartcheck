//BAD
contract SimpleBank {

    function hashingsha3 () returns (bytes32 hash){
        uint time = block.timestamp;//!!!
        return sha3(time);
    }
}
//GOOD
contract SimpleBank {

    function hashingsha3 () returns (bytes32 hash){
        bytes32 b = block.blockhash(1);
        return sha3(b);
    }
}
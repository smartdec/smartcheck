contract EGC is StandardToken{
    function kill() onlyOwner{
        // <yes> <report> SOLIDITY_USING_SUICIDE  27cb59
        suicide(owner);
    }
}
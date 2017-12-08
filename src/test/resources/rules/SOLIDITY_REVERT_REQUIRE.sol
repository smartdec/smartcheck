contract f{
    function a(){
    // <yes> <report> SOLIDITY_REVERT_REQUIRE c56b12
        if (x>y) { revert(); }
    }
    modifier atStage(Stages _stage) {
        if (stage != _stage)
            // Contract not in expected state
            revert();
        _;
    }
}
contract f{
    function a(){
    // <yes> <report> SOLIDITY_REVERT_REQUIRE c56b12
        if (x>y) { throw(); }
    }
}
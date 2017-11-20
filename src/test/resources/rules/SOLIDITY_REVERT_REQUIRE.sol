contract f{
    function a(){
    // <yes> <report> SOLIDITY_REVERT_REQUIRE c56b12
        if (x>y) { revert(); }
    }
}
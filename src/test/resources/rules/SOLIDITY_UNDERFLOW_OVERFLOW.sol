contract a{
    function b(){
    // <yes> <report> SOLIDITY_UNDERFLOW_OVERFLOW  11ca45b <yes> <report> SOLIDITY_UNDERFLOW_OVERFLOW  d48ac4
        for (uint i=100; i >= 0; i--) {
        }
        for (uint i=0; i <= 0; i--) {
        }
        for (uint i=100; i >= 1; i--) {
        }
    // <yes> <report> SOLIDITY_UNDERFLOW_OVERFLOW  d48ac4
        require(a>=0);
        require(a<=0);
        require(a>=7);
    }
}
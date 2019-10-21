pragma solidity 0.4.24;

contract GasLimitInLoops {

    function foo() public returns(uint) {
        return(100);
    }

    function test_while() public {
        uint x=0;
        uint[] memory y;
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 38f6c7
        while ( x < foo()) { 
            x++;
        }
        while ( x > 100) {
            x++;
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 17f23a
        while (y[5]<x) {
            x++;
        }
    }

    function test_for(address[] _addr, uint amount) public {

        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 4b7do5
        for (uint i = 0; i < _addr.length; i++) {
            _addr[i].transfer(100);
        }

        uint n = _addr.length;
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 4b7do5
        for (i = 0; i < n; i++) {
            _addr[i].transfer(100);
        }

        uint m;
        m = _addr.length;
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 4b7do5
        for (i = 0; i < m; i++) {
            _addr[i].transfer(100);
        }

        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS 4b7do5
        for (uint k ; k < _addr.length; k++) {
            _addr[k].transfer(100);
        }

        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS v5j3d9
        for (i = _addr.length; i > 0 ; i--){
            _addr[i].transfer(100);
        }
        // <yes> <report> SOLIDITY_GAS_LIMIT_IN_LOOPS v5j3d9
        for (uint j = _addr.length; j > 0 ; j--){
            _addr[j].transfer(100);
        }
    }
}
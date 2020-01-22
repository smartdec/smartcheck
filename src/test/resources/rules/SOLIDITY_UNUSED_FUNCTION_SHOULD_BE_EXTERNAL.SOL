pragma solidity 0.6.0;

abstract contract T {
    function f0(uint256 a) pure external virtual returns (uint256);
}

contract Test is T {

    // <yes> <report> SOLIDITY_UNUSED_FUNCTION_SHOULD_BE_EXTERNAL 73ufc1
    function badf1() public pure returns (uint256){
        return 5;
    }

    // <yes> <report> SOLIDITY_UNUSED_FUNCTION_SHOULD_BE_EXTERNAL 73ufc1
    function badf2(uint256 a) pure public returns (uint256){
        require(a > 7);
        return 5;
    }

    function notbadf2(uint256 a) pure public returns (uint256){
        require(a > 7);
        return 5;
    }

    function f0(uint256 a) pure external override returns (uint256){
        require(a > 7);
        return 5;
    }

    function f1() private pure returns (uint256){
        return 5;
    }

    function f2(uint256 a) private pure returns (uint256){
        require(a > 7);
        return 5;
    }

    function f3() public pure returns (uint256){
        return 5;
    }

    function f4(uint256 a) public pure returns (uint256){
        require(a > 7);
        return 5;
    }

    function useFunctions() private returns(uint256) {
        uint256 temp = f3();
        temp = f4(9);
        return temp;
    }
}

contract Child is Test {
    function useOne() private {
        notbadf2(54);
    }
}

interface ITest {
    function notUsed() public;
}

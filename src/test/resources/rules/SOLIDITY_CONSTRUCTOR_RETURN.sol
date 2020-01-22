pragma solidity 0.4.24;

contract HoneyPot {

    bytes internal constant ID = hex"60203414600857005B60008080803031335AF100";

    constructor () public payable {
        bytes memory contract_identifier = ID;
        // <yes> <report> SOLIDITY_CONSTRUCTOR_RETURN 8saf21
        assembly { return(add(0x20, contract_identifier), mload(contract_identifier)) }
    }

    function withdraw() public payable {
        require(msg.value >= 1 ether);
        msg.sender.transfer(address(this).balance);
    }
}

contract HoneyPotOldSchool {

    bytes internal constant ID = hex"60203414600857005B60008080803031335AF100";

    function HoneyPotOldSchool() public payable {
        bytes memory contract_identifier = ID;
        // <yes> <report> SOLIDITY_CONSTRUCTOR_RETURN 7gaf21
        assembly { return(add(0x20, contract_identifier), mload(contract_identifier)) }
    }

    function withdraw() public payable {
        require(msg.value >= 1 ether);
        msg.sender.transfer(address(this).balance);
    }
}

contract FPTest {

    function FPTest(address target) public payable {
        assembly {
            let freeMemoryPtrPosition := 0x40
            let calldataMemoryOffset := mload(freeMemoryPtrPosition)
            mstore(freeMemoryPtrPosition, add(calldataMemoryOffset, calldatasize))
            calldatacopy(calldataMemoryOffset, 0x0, calldatasize)

            let ret := delegatecall(gas, target, calldataMemoryOffset, calldatasize, 0, 0)

            let returndataMemoryOffset := mload(freeMemoryPtrPosition)
            mstore(freeMemoryPtrPosition, add(returndataMemoryOffset, returndatasize))
            returndatacopy(returndataMemoryOffset, 0x0, returndatasize)

            switch ret
            case 0 {
                revert(returndataMemoryOffset, returndatasize)
            }
        }
    }
}
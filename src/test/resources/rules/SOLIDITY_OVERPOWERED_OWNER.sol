pragma solidity 0.4.24;

contract MyTreasure {
    address public myAddr;
    uint public price;

    modifier onlyOwner() {
        require(msg.sender == myAddr);
        _;
    }
    // <yes> <report> SOLIDITY_OVERPOWERED_OWNER 43jfq2
    function withdrawAll() public onlyOwner {
        myAddr.transfer(this.balance);
    }
    // <yes> <report> SOLIDITY_OVERPOWERED_OWNER 43jfq2
    function transferAll() public {
        require(msg.sender == myAddr);
        myAddr.transfer(this.balance);
    }
    // <yes> <report> SOLIDITY_OVERPOWERED_OWNER 43jfq2
    function sendAll() public {
        require(msg.sender == myAddr);
        myAddr.transfer(this.balance);
    }
    function printAll() public {
        require(msg.sender == myAddr);
    }
    // <yes> <report> SOLIDITY_OVERPOWERED_OWNER j83hf7
    function setPrice(uint _price) public onlyOwner {
        price = _price;
    } 
    // <yes> <report> SOLIDITY_OVERPOWERED_OWNER j83hf7
    function setNewPrice(uint _price) public {
        require(msg.sender == myAddr);
        price = _price;
    }
}
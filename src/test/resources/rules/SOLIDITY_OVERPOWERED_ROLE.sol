pragma solidity 0.4.24;

contract MyTreasure {
    address public myAddr;
    uint public price;

    modifier onlyOwner() {
        require(msg.sender == myAddr);
        _;
    }
    // <yes> <report> SOLIDITY_OVERPOWERED_ROLE j83hf7
    function setPrice(uint _price) public onlyOwner {
        price = _price;
    } 
    // <yes> <report> SOLIDITY_OVERPOWERED_ROLE j83hf7
    function initNewPrice(uint _price) public {
        require(msg.sender == myAddr);
        price = _price;
    }
    // <yes> <report> SOLIDITY_OVERPOWERED_ROLE j83hf7
    function setNewPrice(uint _price) public {
        require(myAddr == msg.sender);
        price = _price;
    }

    function withdrawAll(uint _price) public onlyOwner {
        myAddr.transfer(this.balance);
    }

    function setAll() public {
        require(msg.sender == myAddr);
        myAddr.transfer(this.balance);
    }

    function setMy(uint _price) public {
        myAddr.transfer(this.balance);
    }

    function setNew() public returns() {
        require(msg.sender == myAddr);
    }
}
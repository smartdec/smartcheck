contract SimpleGame {
    address winner;
    uint constant reward = 100;

    function play() {
        // win game
        winner = msg.sender;
    }
    function getReward() {
        winner.send(reward);//!!!
    }
}
contract TokenMarket {
    uint price = 10;
    address owner;

    function setPrice(uint newPrice) {
        if (msg.sender == owner)
        price = newPrice;
    }

    function sellToken() {
        msg.sender.send(price);//!!!
    }
}
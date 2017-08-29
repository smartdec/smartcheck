contract SimpleBank {
    function sendMoney(address to, uint amount) {
        to.transfer(amount);//нет проверки на длину адреса
    }
}
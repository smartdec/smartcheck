contract Bob {
    bool sent = false;
//bad
    function ping(address c) {
        if (!sent) {
            c.call.value(2)();
            sent = true;//8a1600
            c(2)();
        }
    }
//not bad
    function ping(address c) {
        if (!sent) {
            sent = true;//нет ошибки
            c.call.value(2)();
        }
    }
}

contract Bob {
    bool sent = false;

    function ping(address c) {
        if (!sent) {
            a = 4;
            c.call.value(f(7))();//a91607
            a = 5;
        }
    }

    function ping(address c) {
        if (!sent) {
            b = 1;
            c.call.value(4)();
            c.call.value(2)();
        }
    }
}

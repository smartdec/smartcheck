contract Bob {
    bool sent = false;

    function ping(address c) {
        if (!sent) {
            a = 1;
            a = 2;
            a = 3;
            a = 4;
            c.call.value(f(7))();//a91607
            c.call.value(2)();//a91607
            c.call.value(2)();//a91607
            a = 5;
            a = 6;
            a = 7;
        }
    }

    function ping(address c) {
        if (!sent) {
            b = 1;
            b = 2;
            c.call.value(4)();
            c.call.value(2)();
            c.call.value(5)();
        }
    }
}

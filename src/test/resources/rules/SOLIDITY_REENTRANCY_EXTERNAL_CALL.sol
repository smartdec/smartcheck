contract Bob {
    bool sent = false;
//bad
    function ping(address c) {
        if (!sent) {
            a = 1;
            a = 2;
            a = 3;
            a = 4;
            c.call.value(f(7))();//8a1600, 1337b7
            c.call.value(2)();//8a1600, 1337b7
            c.call.value(2)();//8a1600, 1337b7
            a = 5;
            a = 6;
            a = 7;
        }
    }

    function ping(address c) {
        if (!sent) {
            b = 1;
            b = 2;
            c.call.value(4)();//1337b7
            c.call.value(2)();//1337b7
            c.call.value(5)();//1337b7
        }
    }
}

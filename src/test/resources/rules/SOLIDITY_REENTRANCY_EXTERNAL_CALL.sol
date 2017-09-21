contract Bob {
    function ping(address c) {
        if (!sent) {
            a = 4;
            c.call.value(f(7))();//de222d
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

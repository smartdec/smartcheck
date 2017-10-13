contract Bob {
    function ping(address c) {
        if (!sent) {
            a = 4;
            // <yes> <report> SOLIDITY_REENTRANCY_EXTERNAL_CALL de222d
            c.call.value(f(7))();
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

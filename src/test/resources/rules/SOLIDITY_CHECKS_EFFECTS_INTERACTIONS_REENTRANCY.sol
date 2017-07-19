contract Bob {
    bool sent = false;
//bad
    function ping(address c) {
        if (!sent) {
            c.call.value(2)();
            sent = true;
        }
    }
//not bad
    function ping(address c) {
        if (!sent) {
            sent = true;
            c.call.value(2)();
        }
    }
}

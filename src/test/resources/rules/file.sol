contract Test {
    event ReturnFromExternal();
    function foo() {
        0x123456.call.value()();
        ReturnFromExternal();    // despite re-entrancy, this is safe: not changing internal state
    }
}

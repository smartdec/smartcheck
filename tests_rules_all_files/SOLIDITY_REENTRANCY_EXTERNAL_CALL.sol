contract Bob {//5a1547
    bool sent = false;//8a1726
//bad
    function ping(address c) {//8a1725
        if (!sent) {
            a = 1;
            a = 2;
            a = 3;
            a = 4;
            c.call.value(f(7))();//1330c4, 1427c4
            c.call.value(2)();//1330c4, 1427c4
            c.call.value(2)();//1330c4, 1427c4
            a = 5;
            a = 6;
            a = 7;
        }
    }

    function ping(address c) {
        if (!sent) {
            b = 1;
            b = 2;
            c.call.value(4)();//1427c4
            c.call.value(2)();//1427c4
            c.call.value(5)();//1427c4
        }
    }
}

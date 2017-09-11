contract Test {
    function withdraw() {
        nameReg.call.gas(1000000).value(1 ether)("register", "MyName");
        }
    }


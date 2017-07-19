pragma solidity ^0.4.11;
contract C {
    uint someVariable;
    byte[] someVariable1;//8a1648
    bytes someVariable2;
    uint[] data;
    function f() {
        uint[] x = data;
        x.push(2);
    }
}
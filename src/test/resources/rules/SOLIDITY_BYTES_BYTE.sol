pragma solidity ^0.4.11;
contract C {
    uint someVariable;
    byte[] someVariable1;//a91628
    bytes someVariable2;
    uint[] data;
    function f() {
        uint[] x = data;
        x.push(2);
    }
}
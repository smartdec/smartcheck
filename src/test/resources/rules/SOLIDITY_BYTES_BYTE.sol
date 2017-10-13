pragma solidity ^0.4.11;
contract C {
    uint someVariable;
    // <yes> <report> SOLIDITY_BYTES_BYTE f13a9f
    byte[] someVariable1;
    bytes someVariable2;
    uint[] data;
}

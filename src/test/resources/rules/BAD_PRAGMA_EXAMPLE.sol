pragma solidity ^0.4.0;//pragma
contract SolidityExampleRule {

    string str;

    function SolidityExampleRule() {
        str = "Hello!";
    }

    function sayHello() returns (string) {
        return str;
    }
}

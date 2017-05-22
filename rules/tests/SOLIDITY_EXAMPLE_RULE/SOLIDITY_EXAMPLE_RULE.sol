contract SolidityExampleRule {

    string str;
    
    function SolidityExampleRule() {
        str = "Hello!";
    }
    
    function sayHello() returns (string) {
        return str;
    }
}

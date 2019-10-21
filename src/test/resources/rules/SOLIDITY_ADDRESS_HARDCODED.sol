pragma solidity 0.4.24;

contract C {
    
    event Transfer(address s, uint amount);
    
    function g(address s) returns(address) {
        return s;
    }
    
    function badPractice() {
        // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  adc165
        address x = 0xf64B584972FE6055a770477670208d737Fff282f;
        // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  adc165
        x = g(0x72ba7d8e73fe8eb666ea66babc8116a41bfb10e2);
        // too short - not an address
        x = 0x123;
        // <yes> <report> SOLIDITY_ADDRESS_HARDCODED  f32db1
        x = address(342);
        x = address(0);        
        x = g(address(0));
        x = 0x0;
        x = g(0x0);
    }
    
    function goodPractice(address _token, uint balance) {

        if ((address(0) == _token)||(0x0 == _token)) {
            Transfer(address(0), balance);
        }
        if ((address(0) != _token)||(0x0 != _token)) {
            Transfer(0x0, balance);
        }      
    }
}

pragma solidity 0.4.24;

contract dataStorage {
    uint[] public data;

    function badPractice(uint[] _data) external {
        for(uint i = 0; i < _data.length; i++) {
        // <yes> <report> SOLIDITY_ARRAY_LENGTH_MANIPULATION 43ba1c
            data.length++;
            data[i]=_data[i];
        }
        // <yes> <report> SOLIDITY_ARRAY_LENGTH_MANIPULATION 872bdd
        data.length = 10;
        // <yes> <report> SOLIDITY_ARRAY_LENGTH_MANIPULATION 872bdd
        data.length--;
        // <yes> <report> SOLIDITY_ARRAY_LENGTH_MANIPULATION 872bdd
        data.length *= 2;
        // <yes> <report> SOLIDITY_ARRAY_LENGTH_MANIPULATION 872bdd
        data.length -= 2;
        // <yes> <report> SOLIDITY_ARRAY_LENGTH_MANIPULATION 872bdd
        data.length += 2;
        // <yes> <report> SOLIDITY_ARRAY_LENGTH_MANIPULATION 872bdd
        data.length /= 2;
    }

    function goodPractice(uint[] _data) external {
        for(uint i = 0; i < _data.length; i++) {
            data.push(_data[i]);
        }
        uint a;
        if(data.length == 10) {
            a = data.length;
            a /= data.length;
            a *= data.length;
            a += data.length;
            a -= data.length;
        }
    }
}
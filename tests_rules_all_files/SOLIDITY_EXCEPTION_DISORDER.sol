pragma solidity ^0.4.11;//5a1037

contract SolidityUncheckedSend {
    function unseatKing(address a, uint w) {//8a1725
        a.call.value(w);//ca0826
        a.send(w);//ce0826//5a1041
        a.delegatecall(w);//19cea2
    }
    function delegatecallSetN(address _e, uint _n) {//8a1725
        if (!_e.delegatecall(bytes(sha3("setN(uint256)"), u))) throw;//8a1139
    }
    function delegatecallSetN(address _e, uint _n) {//8a1725
        if (!_e.call(bytes(sha3("setN(uint256)"), u))) throw;//8a1139
    }
    function delegatecallSetN(address _e, uint _n) {//8a1725
        if (!_e.send(bytes(sha3("setN(uint256)"), u))) throw;//8a1139//5a1041
    }
}



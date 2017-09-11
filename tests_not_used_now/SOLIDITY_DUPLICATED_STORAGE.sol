contract Storage {
    struct Info {
    address owner;
    uint amount;
    }
mapping (address =&gt; Info) addressInfo;
mapping (uint =&gt; Info) indexInfo;
uint index;
function create(uint _amount) {
var info = Info(msg.sender, _amount);
indexInfo[index] = info;//!
addressInfo[msg.sender] = info;//!
++index;
}
function burn(address _to, uint _amount) {
var info = addressInfo[msg.sender];
info.amount = safeSub(info.amount, _amount);
}
}
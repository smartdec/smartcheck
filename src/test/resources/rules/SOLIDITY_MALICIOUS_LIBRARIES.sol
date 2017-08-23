library Library{
uint add(uint x, uint y) returns(uint);
}
contract MyContract{

address library;
MyContract(address lib){
library = lib;
x = Library(lib).add(1,1);
}

}
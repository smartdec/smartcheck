funders: {sender: address, value: wei_value}[int128]
nextFunderIndex: public(int128)


@public
# <yes> <report> VYPER_LOCKED_MONEY 30281d
@payable
def participate(i: int128):
    nfi: int128 = self.nextFunderIndex
    self.funders[nfi] = {sender: msg.sender, value: msg.value}
    self.nextFunderIndex = nfi + 1


@public
def final(i : int128):
    data: bytes[32]
    #raw_call(self.funders[i].sender, data, outsize = 32, value = self.funders[i].value, gas = 100000)
    pass


@public
def finalize(i : int128):
    #selfdestruct(self.funders[i].sender)
    pass


@public
def refund(i: int128):
    #send(self.funders[i].sender, self.funders[i].value)
    pass
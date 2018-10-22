Payment: event({amount: int128, from: indexed(address)})

@public
@payable
def __default__():
    send(msg.sender, 15)

@public
@payable
#<yes> <report> VYPER_REDUNDANT_FALLBACK_REJECT am179p
def __default__():
    throw


@public
def __default__():
    throw

@public
@payable
def __default__():
    throw
    log.Payment(msg.value, msg.sender)

@public
@payable
#<yes> <report> VYPER_REDUNDANT_FALLBACK_REJECT am180p
def __default__():
    assert msg.value < 15

@public
def __default__():
    assert msg.balance < 15

@public
@payable
def __default__():
    assert msg.value < 15
    log.Payment(msg.value, msg.sender)

Payment: event({amount: int128, from: indexed(address)})

@public
@payable
def __default__():
    log.Payment(msg.value, msg.sender)

@public
@payable
def __default__():
    throw

// <yes> <report> VYPER_REDUNDANT_FALLBACK_REJECT am179p
@public
def __default__():
    throw

@public
@payable
def __default__():
    throw
    log.Payment(msg.value, msg.sender)

// <yes> <report> VYPER_REDUNDANT_FALLBACK_REJECT am180p
@public
@payable
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

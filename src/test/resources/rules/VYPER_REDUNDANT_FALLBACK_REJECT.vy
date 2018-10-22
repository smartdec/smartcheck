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
@payable
def __default__():
    throw
    pass

@public
@payables
def __default__():
    if True:
        throw
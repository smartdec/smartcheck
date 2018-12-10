Approval: event({_owner: indexed(address), _spender: indexed(address), _value: uint256(wei)})


allowances: (uint256(wei)[address])[address]


@public
# <yes> <report> VYPER_ERC20_APPROVE af782c
def approve(_spender : address, _value : uint256(wei)) -> bool:
    _sender: address = msg.sender
    self.allowances[_sender][_spender] = _value
    # Fire approval event
    log.Approval(_sender, _spender, _value)
    return True

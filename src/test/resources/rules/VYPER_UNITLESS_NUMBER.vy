numberas: public(uint256)

@public
def __init__(deadline: timestamp, goal: wei_value, timelimit: timedelta) -> uint256:
    # <yes> <report> VYPER_UNITLESS_NUMBER fgg331
    self.numberas = as_unitless_number(goal)
    # <yes> <report> VYPER_UNITLESS_NUMBER fgg331
    self.numberas = as_unitless_number(deadline)
    # <yes> <report> VYPER_UNITLESS_NUMBER fgg331
    self.numberas = as_unitless_number(timelimit)
    return as_unitless_number(timelimit)

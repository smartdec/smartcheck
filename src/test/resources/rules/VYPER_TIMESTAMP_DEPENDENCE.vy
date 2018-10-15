
test_end: public(timestamp)
test_start: public(timestamp)

@public
def test_function()->uint256:

    # <yes> <report> VYPER_TIMESTAMP_DEPENDENCE to882y
    self.test_start = block.timestamp

    # <yes> <report> VYPER_TIMESTAMP_DEPENDENCE to993y
    assert self.test_end == block.timestamp
    assert self.test_end == self.test_end
    assert self.test_end < block.timestamp

    # <yes> <report> VYPER_TIMESTAMP_DEPENDENCE to993y
    if self.test_end == block.timestamp:

        # <yes> <report> VYPER_TIMESTAMP_DEPENDENCE to882y
        self.test_end = block.timestamp
        return(0)

    if self.test_end == self.test_start:
        return(0)

    if self.test_end > block.timestamp:
        return(0)



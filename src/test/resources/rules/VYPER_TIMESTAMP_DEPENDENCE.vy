test_end: public(timestamp)
test_start: public(timestamp)

@public
def timefunction()->bool:
    return True

@public
def test_function():

    # <yes> <report> VYPER_TIMESTAMP_DEPENDENCE to993y
    if self.test_start != block.timestamp:
        pass

    # <yes> <report> VYPER_TIMESTAMP_DEPENDENCE to993y
    assert self.test_end == block.timestamp
    assert self.test_end == self.test_end
    assert self.test_end < block.timestamp

    # <yes> <report> VYPER_TIMESTAMP_DEPENDENCE to993y
    if self.test_end == block.timestamp:

        # <yes> <report> VYPER_TIMESTAMP_DEPENDENCE to993y
        if self.test_end != block.timestamp:
            pass


    if self.test_end == self.test_start:
        pass

    if self.test_end > block.timestamp:
        pass

    if self.test_end == timefunction(block.timestamp):
        pass

@public
def func_1(user: address):
# <yes> <report> VYPER_BALANCE_EQUALITY 5094ad
    if (user.balance == 0):
        pass


@public
def func_2(user: address):
# <yes> <report> VYPER_BALANCE_EQUALITY 5094ad
    if (user.balance != 0):
        pass

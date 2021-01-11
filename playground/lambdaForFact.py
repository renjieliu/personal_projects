x = lambda input: input if input == 1 else (1 if input ==0 else input * x(input - 1))

print ( max([x(y) for y in range(6) ]))


def x(n):
    for i in range(n):
        yield i


print(x(5))


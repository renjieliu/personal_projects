def fib(n):
    return fib_mem(n, [0] * (n+1))

def fib_mem(i, mem:'List'):
    if i == 0 or i ==1:
        return 1

    else:
        if mem[i] == 0:
            mem[i] = fib_mem(i-2, mem) + fib_mem(i-1, mem)

        return mem[i]

print(fib(5))





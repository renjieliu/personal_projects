def fib_memo (n, arr):
    if n==1 or n ==2:
        return 1
    else:
        if arr[n] != 0:
            return arr[n]
        else:
            arr[n] = fib_memo(n-1, arr) + fib_memo(n-2, arr)

    return arr[n]


def fib(n):
    arr = [0]*(n+1)
    return fib_memo(n,arr)

print(fib(100))
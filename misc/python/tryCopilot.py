def max(arr):
    max = arr[0]
    for i in range(1, len(arr)):
        if arr[i] > max:
            max = arr[i]
    return max

# iterative approach to calculate a fibonacci number
def fib(n):
    if n == 0:
        return 0
    if n == 1:
        return 1
    a = 0
    b = 1
    for i in range(2, n + 1):
        c = a + b
        a = b
        b = c
    return b
    

# create a function to print prime numbers smaller than 10000
def prime():
    for i in range(2, 10000):
        for j in range(2, i):
            if i % j == 0:
                break
        else:
            print(i)

prime()

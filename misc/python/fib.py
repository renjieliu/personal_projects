def fib(n):
    if n==0:
        return 0
    if n==1 or n==2:
        return 1
    else:
        list =[]
        list.append(1)
        list.append(1)
        for i in range(2,n):
            list.append(list[i-2]+list[i-1])

        return list[-1]



def fib2(n):
    if n==0:
        return 0

    if n==1 or n==2:
        return 1
    else:
        return fib2(n-1) + fib(n-2)



def fib_entry(n):
    return fib_memo(n, [0]*(n+1))


def fib_memo(i, mem:'List'):
    if i == 0 or i== 1:
        mem[i] = i
        return i
    if mem[i] == 0:
        mem[i] = fib_memo(i-2, mem) +  fib_memo(i-1, mem)
    print(mem)
    return mem[i]

print(fib(5))

print(fib_entry(5))

#print(fib2(1000))




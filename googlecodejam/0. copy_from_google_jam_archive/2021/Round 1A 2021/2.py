def func(arr): 
    s = sum(arr)
    def combo(output, arr, curr, n): 
        if len(curr) == n: 
            output.append(curr)
        else:
            for i in range(len(arr)):
                combo(output, arr[i+1:], curr+[arr[i]], n)
    def prod(a):
        output=1
        for x in a:
            output *= x
        return output
    
    output = []
    for i in range(1, len(arr)):
        combo(output, arr, [], i)
    res = -float('inf')
    for o in output:
        if prod(o) == s - sum(o):
            res = max(res, s-sum(o))
        
        
    return 0 if res == -float('inf') else res


cases = int(input()) #total case counts
for i in range(1, cases+1):
    N = int(input()) 
    arr = []
    for j in range(N):
        t = str(input()).split(' ')
        a = int(t[0])
        b = int(t[1])
        arr += [a]*b
        
    res = func(arr)
    print(f"Case #{i}: {res}")
    
    
    

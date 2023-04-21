def f(mapping, arr): #calculation logic
    lkp = set()
    for a in arr:
        curr = "" 
        for c in a:
            curr += mapping[ord(c) - ord('A')]
        if curr in lkp:
            return 'YES'
        lkp.add(curr)
    return 'NO'


# main driver
cases =  int(input()) #total case counts
for i in range(1, cases+1):
    mapping =  input().split(' ') 
    N = int(input()) # to be encoded
    arr = [] 
    # arr = ['ABC', 'BC', 'BCD', 'CDE']
    for _ in range(N):
        arr.append(input())
    res = f(mapping, arr)
    print(f"Case #{i}: {res}")


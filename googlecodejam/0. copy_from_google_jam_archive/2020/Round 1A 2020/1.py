def f(arr):
    lst = sorted(arr, key = lambda x: len(x), reverse = 1)
    curr = lst[0].replace('*','')
    for i in range(1, len(lst)):
        x = len(lst[i].replace('*',''))
        if curr[-x:] != lst[i].replace('*',''):
            return "*"
    return curr.replace('*','')  

# print(f(['*CONUTS'
# ,'*COCONUTS'
# ,'*OCONUTS'
# ,'*CONUTS'
# ,'*S']))

# print(f(['*XZ', '*XYZ']))



cnt = int(input())
for i in range(1, cnt + 1): # go through all the cases
    N = int(input())
    arr = []
    for j in range(N):
        arr.append(input())
    res = f(arr)
    print("Case #{}: {}".format(i, res))  #format and output
    
    

lkp = set()
# lkp.add(10**19)
i = 1
while i < 10000:
    s = str(i)
    j = i+1
    while True:
        s += str(j) 
        if int(s) < 10**8:
            lkp.add(int(s))
            j += 1
        else:
            break
    i+=1
lkp = sorted(list(lkp))
# print(lkp)
def f(n, lkp):
    if n >= lkp[-1]:
        return 0
    s = 0 
    e = len(lkp)-1
    while s <= e:
        mid = (s+e)//2
        if lkp[mid] <= n:
            s = mid + 1
        elif lkp[mid] > n:
            e = mid - 1 
    
    return lkp[s]

# f(68000, lkp)

# arr = []
# for i in range(1, 10**6+1):
# #     print(i)
#     arr.append(f(i, lkp))
    
    
cases = int(input()) #total case counts
for i in range(1, cases+1):
    num = int(str(input()))
    res = f(num,lkp)
    print(f"Case #{i}: {res}")       
    
    

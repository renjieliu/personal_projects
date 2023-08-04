def func(arr):
    tick = (1/12)*(10**-10)
    arr = [int(_) for _ in arr] 
    if arr[0] == arr[1] == arr[2]:
        return "0 0 0 0"
    else:
        a = round(arr[0]*tick,10)
        b = round(arr[1]*tick,10)
        c = round(arr[2]*tick,10)
        stk = sorted([a,b,c])
        hour = 30 #one unit degree
        minute = 6 #one unit degree
        second = 6 #one unit degree
        for h in range(12):
            for m in range(60):
                for s in range(60):
                    curr = [hour*h + hour*(m/60) + hour*(s/3600), m*minute + minute*(s/60) , s * second]
                    curr.sort()
                    if sorted(curr) == stk:
                        return f'{h} {m} {s} 0'
        
cases = int(input()) #total case counts
for i in range(1, cases+1):
    res = func(str(input()).split(' '))
    print(f"Case #{i}: {res}")   
    
    
    

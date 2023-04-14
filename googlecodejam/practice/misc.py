def f(a): #calculation logic
    pass



# main driver
cases = int(input()) #total case counts
for i in range(1, cases+1):
    N = int(input()) # each input
    arr = str(input()).split(' ')
    res = f(1,1)
    print(f"Case #{i}: {res}")




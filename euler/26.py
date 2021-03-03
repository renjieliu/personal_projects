def divide(a): 
    output =  "0."
    loc = 0 #to store the rem location 
    rem = 10
    hmp = {}
    while rem !=0:
        output += str(rem // a)
        rem %= a
        if rem not in hmp:
            hmp[rem] = loc
        else:
            return loc - hmp[rem] #if current rem was met, then the recurring starts from here. 
        rem *=10
        loc += 1
    return 0

m = 0
output = 1
for i in range(1, 1001):
    curr = divide(i)
    if curr > m: 
        m = curr
        output = i
print(output)
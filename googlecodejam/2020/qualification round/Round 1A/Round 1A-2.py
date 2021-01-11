def f(n):
    output = ["1 1"]
    rem = n-1
    if rem ==0: return  output
    for s in range(2, 501):
        if rem > 500-s:
            output.append(str(s) + " " + str(s-1))
            rem -= (s-1)
            if 0 < rem <= 500-s:
                output.append(str(s) + " " + str(s))
                rem -= 1
        else:
            output.append(str(s) + " " + str(s))
            rem -= 1
        if rem == 0:
            break
    
    return output
    
cnt = int(input())
for i in range(1, cnt + 1): # go through all the cases
    N = int(input())
    res = f(N)
    print("Case #{}:".format(i))  #format and output
    for r in res:
        print(r)

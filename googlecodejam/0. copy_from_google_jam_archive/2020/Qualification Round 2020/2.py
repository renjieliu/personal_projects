def f(s):
    output = ""
    stk = []
    for i in s:
        c = int(i)
        if c == 0:
            while stk:
                output+=")"
                stk.pop()
            output+= i
        else:
            if len(stk) == c:
                output+= i 
            elif len(stk) > c:
                while len(stk)>c:
                    output+=")"
                    stk.pop()
                output+=i
            else:
                while len(stk) < c:
                    output+="("
                    stk.append("(")
                output+=i
    while stk:
        output+=")"
        stk.pop()
    return output         
    
cnt = int(input())
for i in range(1, cnt + 1): # go through all the cases
    s = input() 
    res = f(s)
    print("Case #{}: {}".format(i, res))  #format and output




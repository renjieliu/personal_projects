def func(arr):
    x = arr[0] #CJ
    y = arr[1] #JC
    mural = arr[2]
    if len(mural) < 2 or mural.count("?") == len(mural): 
        return 0
    while "??" in mural:
        mural = mural.replace("??", "?")
    output = (mural.count('CJ')*x + mural.count('JC')*y)
    mural = list(mural)
    while mural and mural[0] == "?": #the leading ? should be same as the first non ? character
        mural.pop(0)
    while mural and mural[-1] == "?": # the trailing ? should be same as the last non ? character
        mural.pop()
    i = 1 
    while i < len(mural):
        if mural[i] == "?":
            if mural[i-1] != mural[i+1]:
                output+=x if mural[i-1] == "C" else y
        i+=1

    return f'{output}' 

# print(func([2,3,"CJ?CC?"]))
# print(func([4,2,"CJCJ"]))
# print(func([1,3,"C?J"]))
# print(func([2,5,"??J???"]))


# print(func([1,2]))
# print(func([7,6,5,4,3,2,1]))
# print(func([4, 5, 3, 1, 6, 7]))

cases = int(input()) #total case counts
for i in range(1, cases+1):
    #N = int(input()) 
    arr = str(input()).split(' ')
    arr[0] = int(arr[0])
    arr[1] = int(arr[1])
    res = func(arr)
    print(f"Case #{i}: {res}")
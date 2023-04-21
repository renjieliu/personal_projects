def f(arr1, arr2, arr3):
    c = [int(arr1[0]), int(arr2[0]), int(arr3[0])]
    m = [int(arr1[1]), int(arr2[1]), int(arr3[1])]
    y = [int(arr1[2]), int(arr2[2]), int(arr3[2])]
    k = [int(arr1[3]), int(arr2[3]), int(arr3[3])]
    if min(c) + min(m) + min(y) + min(k) < 10**6:
        return "IMPOSSIBLE"
    else:
        r_c, r_m, r_y, r_k = 0,0,0,0
        rem = 10**6
        r_c = min(min(c), rem)
        rem -= r_c
        if rem > 0:
            r_m = min(min(m), rem)
            rem -= r_m
        if rem > 0:
            r_y = min(min(y), rem)
            rem -= r_y
        if rem> 0:
            r_k = min(min(k), rem)
            rem -= r_k
        return str(r_c) + " " + str(r_m) + " " + str(r_y)+ " " +  str(r_k)
    
# f([768763,148041,178147,984173],
# [699508,515362,534729,714381],
# [949704,625054,946212,951187]) 
# sum([699508, 148041, 152451, 0])

cnt = int(input())
for i in range(1, cnt + 1): # go through all the cases
    arr1 = input().split(' ') 
    arr2 = input().split(' ') 
    arr3 = input().split(' ') 
    res = f(arr1, arr2, arr3) 
    print("Case #{}: {}".format(i,res))  #format and output
    
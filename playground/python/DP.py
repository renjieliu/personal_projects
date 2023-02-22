def dp(arr):
    opt = [0]*len(arr)
    opt[0] = arr[0]
    opt[1] = max(arr[0], arr[1])
    for i in range(2,len(arr)):
        A = opt[i-2]+arr[i]
        B = opt[i-1]
        opt[i] = max(A,B)
    return opt[len(arr)-1]

print(dp([1,2,4,1,7,8,3]))
print(dp([4,1,1,9,1]))






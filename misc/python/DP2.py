def dp2(arr, i,s):
    if i==0:
        return arr[0]==s
    elif s==0:
        return True
    elif arr[i]>s:
        return dp2(arr, i-1, s)
    else:
        A = dp2(arr, i-1, s-arr[i])
        B = dp2(arr, i-1, s)
        return A or B

print(dp2([3,34,4,12,5,2],5, 9))

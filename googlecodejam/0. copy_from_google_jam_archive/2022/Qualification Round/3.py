def f(arr):
    arr = sorted(int(a) for a in arr) 
#     print(arr)
    output=0
    for i in range(len(arr)):
        curr = 1
        j = i+1
        while j < len(arr) and j-i + 1 <= arr[j]:
            curr += 1 
            j+=1
        output = max(curr, output)
    return output 

cnt = int(input())
for i in range(1, cnt + 1): # go through all the cases
    dummy= input()
    arr1 = input().split(' ') 
    res = f(arr1) 
    print("Case #{}: {}".format(i, res))  #format and output
    
    
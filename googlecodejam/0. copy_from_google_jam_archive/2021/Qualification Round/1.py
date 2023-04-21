# Reversort(L):
#   for i := 1 to length(L) - 1
#     j := position with the minimum value in L between i and length(L), inclusive
#     Reverse(L[i..j])

def reverse(arr, i, j):
    t = list(reversed(arr[i:j+1]))
    for k in range(i,j+1):
        arr[k] = t.pop(0)

def minloc(arr):
    curr = float('inf')
    output = None
    for i, c in enumerate(arr):
        if c < curr:
            output = i
            curr = c
    return output
               
def func(arr):
    cnt = 0
    i = 0 
    while i <= len(arr)-2:
        j = minloc(arr[i:])
        cnt += j+1
        reverse(arr, i, i+j)
        i+=1
    return f'{cnt}' 

# print(func([4,2,1,3]))
# print(func([1,2]))
# print(func([7,6,5,4,3,2,1]))

cases = int(input()) #total case counts
for i in range(1, cases+1):
    N = int(input()) 
    arr = [int(_) for _ in str(input()).split(' ')]
    res = func(arr)
    print(f"Case #{i}: {res}")
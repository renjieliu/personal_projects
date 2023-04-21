def func(arr):
    cnt = 0
    prev = arr[0]
    for a in arr[1:]:
        curr = a
        while curr <= prev or str(curr)[:len(str(a))] !=str(a):
            curr+=1
        cnt += len(str(curr)) - len(str(a))
        prev = curr 
    return cnt
# func([1,2,3])
cases = int(input()) #total case counts
for i in range(1, cases+1):
    N = int(input()) 
    arr = str(input()).split(' ')
    res = func([int(_) for _ in arr])
    print(f"Case #{i}: {res}")

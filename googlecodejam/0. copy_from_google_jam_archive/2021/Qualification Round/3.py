def func(n,v):
    arr = [_ for _ in range(1, n+1)]
    if v > (2+n)*(n-2+1)//2 or v < n-1: # if the values fall out of the range
        return 'IMPOSSIBLE'
    else: 
        #1. place the number right left right left, as [2,4,.... 3,1], until the remaining is less than the value 
        #2. move the lowest of the rest number to the proper position, form the rest arr
        #3. if step 1 populated count is odd number , reverse the arr in step 2
        #4. populate the res array
        arr = [_ for _ in range(1, n+1)]
        res = [None for _ in range(1,n+1)]
        add = [_ for _ in range(n-1, 0, -1)]
        curr = n-1 
        rem = v-curr #how many need to be placed
        odd = -1 
        even = 0 
        rnd = 0
        while rem - (n-arr[0]) > 0:
            t = arr.pop(0)
            rnd += 1
            if rnd % 2 == 1 :
                res[odd] = t
                odd -= 1
            else:
                res[even] = t
                even += 1
            rem -= (n-t) 

        arr = [_ for _ in range(rnd+1, n+1)] 
        a = arr[:rem+1]
        a = [a[-1]]+ a[:-1][::-1]
        b = arr[rem+1:]
        arr = a + b
        if rnd % 2 == 1 :
            arr = arr[::-1]
        #rem -= 1
        #print(arr)
        for i in range(len(res)):
            if res[i] == None :
                res[i] = arr.pop(0)

    #     print(res, rem, rnd) 
        #print(res,reversort(res))
#       return res
        return " ".join([str(_) for _ in res]) 


cases = int(input()) #total case counts
for i in range(1, cases+1):
    #N = int(input()) 
    arr = str(input()).split(' ')
    arr[0] = int(arr[0])
    arr[1] = int(arr[1])
    res = func(arr[0], arr[1])
    print(f"Case #{i}: {res}")















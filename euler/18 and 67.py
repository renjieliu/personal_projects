f = open('triangle.txt', 'r')
arr = []
dp = []
for x in f:
    if x != '\n':
        arr.append([])
        dp.append([])
        for y in x.replace('\n','').split(' '):
            arr[-1].append(int(y))
            dp[-1].append(None)
            


def findMax(arr, dp, r, c):
    if dp[r][c]!= None:
        return dp[r][c]
    elif r == 0:
        dp[r][0] = arr[0][0]
        return  dp[r][0]
    else:
        if r==c:
            dp[r][c] = findMax(arr, dp, r-1, c-1) + arr[r][c]
            return dp[r][c]
        elif c ==0:
            dp[r][c] = findMax(arr, dp, r-1, 0) + arr[r][c]
            return dp[r][c] 
        else:
            dp[r][c] = max(findMax(arr, dp, r-1, c-1), findMax(arr, dp, r-1, c)) + arr[r][c] 
            return dp[r][c]

r = len(arr) -1    
for c in range(len(arr[-1])):
    findMax(arr, dp, r, c)

#print(dp)    
max(dp[-1])
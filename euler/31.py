def change(amt, coins):
    dp = [0]*(amt+1)
    dp[0] = 1
    for c in coins:
        for j in range(c, amt+1):
            dp[j] = dp[j] + dp[j-c]
    return dp[-1]

change(200, [1,2,5,10,20,50,100,200])


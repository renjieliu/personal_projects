def distance(s1, s2):
  dp = []
  for r in range(len(s1)):
    dp.append([r])
    for c in range(1,len(s2)+1): #since the first column is populated by r, need to shift one column.
      if r == 0:
        dp[-1].append(c)
      else:
        cost = 0 if s1[r]==s2[c-1] else 1
        dp[-1].append(min(dp[r][c-1]+1, dp[r-1][c]+1, cost+dp[r-1][c-1]))
  return dp[-1][-1]


print(distance("zoologicoarchaeologist","zoopsychologist"))
print(editdistance('renjie','lieu')) #5
print(editdistance('oo','ooo')) #10

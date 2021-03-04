limit = 1000
maxx = 0
output = -1
for n in range(1, limit+1):
    cnt = 0
    for i in range(1, n+1):
        for j in range(i, n+1): 
            k = n -i -j
            if i+j > k and k > 0 and i**2+j**2 == k**2:
                cnt += 1
    if cnt >= maxx:
        maxx = cnt
        output = n
print(maxx)
print(output)
def findAB(N):
    A = str(N).replace("4","3")
    return str(int(A)) + " " + str(N-int(A))


t = int(input())
for i in range(1, t + 1):
    m = int(input())
    print("Case #{}: {}".format(i,findAB(m)))

print(findAB(4))
print(findAB(940))
print(findAB(4444))
print(findAB(444409881))
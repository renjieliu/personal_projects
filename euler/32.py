ref = set()
cnt = 0 
for i in range(1000):
    for j in range(10000):
        cnt+=1
        if cnt %10000 ==0:
            print(cnt)
        curr = i*j
        a = set(str(i))
        b = set(str(j))
        c = set(str(curr))
        if len(str(i) + str(j) + str(curr))== 9 and a&b==set() and a&c == set() and b&c == set():
            s = a | b | c
            if "0" not in s and len(s) == 9:
                print(i, j, curr)
                ref.add(curr)
print(ref)
print(sum(list(ref)))
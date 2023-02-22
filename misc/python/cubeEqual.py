end = 1001
dic  = dict()
for i in range(1, end):
    for j in range(1, end):
        if str(i**3+j**3) in dic.keys():
            dic[str(i ** 3 + j**3)].append(str(i)+"-" +str(j))
        else:
            dic[str(i ** 3 + j ** 3)] = []
            dic[str(i ** 3 + j ** 3)].append(str(i) + "-" + str(j))


for k, v in dic.items():
    if len(v)>1:
        print("|||||||||||||||||||||||")
        print(k)
        for i in v:
            print("------")
            print(i)


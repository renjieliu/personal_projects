def findPrime(N):
    output= []
    t = [None] * (N+1)
    for i in range(2, N):
        for j in range(2,int(N**0.5)):
            if i*j < N:
                t[i*j] = 1

    for i in range(2, len(t)):
        if t[i] == None:
            output.append(i)

    return output


def findCombo(N,S):
    ref = findPrime(N)
    dic = []
    lst = []
    numbers = str(S).split(" ")
    for t in numbers:
        for i in range(1, len(ref)):
            if int(t)%ref[i] == 0 and int(t)//ref[i] in ref:
                dic.append([ref[i], int(t)//ref[i]]) # this is to find which 2 prime numbers for the current number
                lst.append(ref[i]) #add the prime to the pool
                lst.append(int(t)//ref[i]) #add the other one to the pool!
                break

    map = {}
    lst = sorted(list(set(lst)))
    for i, v in enumerate(lst):
        map[v] = chr(i+65) #v is the prime number, value is the letter, i is the index in the list


    output = ""
    wrong  = 0

    #to get the first character -
    if sorted(dic[0]) == sorted(dic[1]):
        prev = dic[0][0] #pick up either one.
        output+=map[prev]
        for i in range(len(numbers)):
            if int(numbers[i])//prev not in dic[i]:
                wrong = 1
                break
            else:
                output += map[int(numbers[i]) // prev]
                prev = int(numbers[i])//prev

        if wrong ==1 :
            output = ""
            prev = dic[0][1]
            output += map[prev]
            for i in range(len(numbers)):
                output += map[int(numbers[i]) // prev]
                prev = int(numbers[i]) // prev

    else:
        prev = list(set(dic[0]) - set(dic[1]))[0]
        output+=map[prev]
        for i in range(len(numbers)):
            output += map[int(numbers[i])//prev]
            prev = int(numbers[i])//prev

    return output


t = int(input())
for i in range(1, t + 1):
    m = int(input().split(" ")[0])
    S = input()
    print("Case #{}: {}".format(i, findCombo(m,S) ))








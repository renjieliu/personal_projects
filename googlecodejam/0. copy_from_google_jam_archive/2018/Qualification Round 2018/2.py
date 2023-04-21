def TroubleSort(n):
    arr1 =[]
    arr2 =[]
    for i in range(len(n)):
        if i%2!=0:
            arr1.append(int(n[i]))
        else:
            arr2.append(int(n[i]))

    arr1.sort()
    arr2.sort()

    output = []

    for i in range(len(arr2)):
        output.append(arr2[i])
        if i < len(arr1):
            output.append(arr1[i])

    return output


def findMismatch(n):
    c = TroubleSort(n.copy())
    for i in range(len(c)-1):
        if c[i+1]<c[i]:
            return i
    return 'OK'


t = int(input())
for i in range(1, t + 1):
    cnt = input()
    array = list()
    for k in str(input()).split(" "):
        array.append(int(k))
    print("Case #{}: {}".format(i, findMismatch(array)))


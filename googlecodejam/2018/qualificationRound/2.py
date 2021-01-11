def t_sort(input):
    output = input
    swap = 1
    while swap != 0:
        swap = 0
        for j in range(0, len(output)-2):
            if output[j]>output[j+2]:
                t = output[j]
                output[j] = output[j+2]
                output[j+2] = t
                swap+=1
    return output

def func(array):
    x = t_sort(array)
    output = -99
    for i in range(0, len(x)-1):
        if x[i]>x[i+1]:
            output = i
            break
    if output == -99:
        return "OK"
    else:
        return str(output)


# print(func("6 7 9 8".split(" ")))

#
t = int(input())
for i in range(1, t + 1):
    cnt = input()
    array = list()
    for k in str(input()).split(" "):
        array.append(int(k))
    print("Case #{}: {}".format(i, func(array)))


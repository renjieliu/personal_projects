def func(S):
    output  = ""
    for i in S:
        if i =="E":
            output+="S"
        elif i=="S":
            output+="E"

    return output


# print(func("SE"))
# print(func("EESSSESE"))


t = int(input())
for i in range(1, t + 1):
    m = int(input())
    S = input()
    print("Case #{}: {}".format(i, func(S) ))




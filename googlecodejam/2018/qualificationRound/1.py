def currentPower(t):
    total = 0
    currentPower = 1
    for i in range(0, len(t)):
        if t[i] == "S":
            total += currentPower
        if t[i] == "C":
            currentPower *= 2
    return total


def func(m, n):
    swap = 0

    if m >= currentPower(n):
        return swap

    else:
        temp = str(n)
        while currentPower(temp) > m:
            appearTimes = int((len(temp) - len(temp.replace("CS", "")))/2)
            temp = temp.replace("CS", "`", appearTimes - 1).replace("CS", "SC").replace("`", "CS") # replace the last CS to SC
            #temp = temp.replace("CS", "SC", 1)
            swap += 1
            if currentPower(temp) <= m:
                return swap
            if swap == len(temp) and m < currentPower(temp):
                print(temp)
                return "IMPOSSIBLE"


t = int(input())
for i in range(1, t + 1):
    m, n = [str(x) for x in input().split(" ")]
    #print(n)
    print("Case #{}: {}".format(i, func(int(m), n)))

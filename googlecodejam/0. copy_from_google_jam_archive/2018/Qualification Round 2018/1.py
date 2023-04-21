def calc(shooting):
    d = 0
    curr = 1
    for i in shooting:
        if i == "S":
            d+=curr
        elif i =="C":
            curr*=2
    return d


def changeTimes(D, input):

    if calc(input) <=D:
        return 0
    elif str(input).count("C") ==0:
        return "IMPOSSIBLE"
    else:
        cnt = 0
        shooting=list(input)
        while "".join(shooting).count("CS") !=0:
            #this is to find the last S to swap with the prev C
            for i in range(len(shooting)-1, 0,-1):
                if shooting[i-1] + shooting[i] == "CS":
                    shooting[i] = "C"
                    shooting[i - 1] = "S"
                    cnt +=1
                    break
            if calc(shooting) <= D:
                return cnt

        if calc(shooting) <= D:
            return cnt

        else:
            return "IMPOSSIBLE"


t = int(input())
for i in range(1, t + 1):
    m, n = [str(x) for x in input().split(" ")]
    print("Case #{}: {}".format(i, changeTimes(int(m),n)))
    
    

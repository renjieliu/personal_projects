import sys

def guess(a, b):
    m = (a+b)//2
    print(m)
    sys.stdout.flush()

    google = input()
    if google == "CORRECT":
        return
    elif google == "TOO_SMALL":
        a = m+1
        guess(a,b)
    else:
        b = m+1
        guess(a, b-1)

T = int(input())
for i in range(T):
    a,b = map(int,input().split())
    i = int(input())
    guess(a, b )

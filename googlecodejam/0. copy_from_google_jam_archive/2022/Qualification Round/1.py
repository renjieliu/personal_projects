def f(r, c):
    print(".."  + "+-"*(c-1)+"+")
    print("." + ".|"*c)
    for i in range(r-1):
        print("+-"*c+"+")
        print("|."*c+"|")
    print("+-"*c+"+")

cnt = int(input())
for i in range(1, cnt + 1): # go through all the cases
    arr = input().split(" ")
    r, c = int(arr[0]), int(arr[1])
    print("Case #{}:".format(i))  #format and output
    f(r, c)

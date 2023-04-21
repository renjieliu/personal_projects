def f(meter, radius, numbers, locations):  
    coverage = []
    for i, loc in enumerate(locations):
        coverage.append([max(0, loc - radius), min(meter, loc + radius)]) 
    #print(coverage)
    if coverage[0][0] > 0 or coverage[-1][1] < meter: # cannot cover the starting point or end
        return 'IMPOSSIBLE'
    if len(coverage) == 1:
        return 1 
    else:
        n = numbers
        for i in range(1, len(coverage)):
            if coverage[i][0] > coverage[i-1][1]: #start cannot cover the previous end
                return 'IMPOSSIBLE'
            if i > 0 and coverage[i][0] == 0: # all the previous can be covered by curr one
                    n -= 1
            elif i == len(coverage)-1:
                if coverage[i-1][1] == meter: # last night not needed
                    n-=1
            else:
                if coverage[i+1][0] <= coverage[i-1][1]: # current light is not needed
                    coverage[i] = coverage[i-1] #mark the current light as previous light
                    n-=1
        return n       



# main driver
# with open(r"C:\Users\liurenjie\Desktop\test_set_2\ts2_input.txt", 'r') as file:
#     cases = int(file.readline())
#     for i in range(1, cases+1):
#         base = file.readline().split(' ')
#         meter = int(base[0])
#         radius = int(base[1])
#         numbers = int(base[2])
#         locations = [int(_) for _ in file.readline().split(' ')]
#         res = f(meter, radius, numbers, locations)
#         print(f"Case #{i}: {res}")

cases =  int(input()) #total case counts
for i in range(1, cases+1):
    base = input().split(' ')
    meter = int(base[0])
    radius = int(base[1])
    numbers = int(base[2])
    locations = [int(_) for _ in input().split(' ')]
    res = f(meter, radius, numbers, locations)
    print(f"Case #{i}: {res}")


















def f(grid):   
    hmp = {}
    for i in range(len(grid)): #time slot position in the orignal array
        g = grid[i]
        if (g[0],g[1]) not in hmp:
            hmp[(g[0],g[1])] = []
        hmp[(g[0],g[1])].append(i)
        if len(hmp[(g[0],g[1])]) > 2:
            return "IMPOSSIBLE"
        
    schedule = sorted(grid)
    j, c = -float('inf'), -float('inf') #to record the activity end time
    output = [None] * len(schedule)
    
    for i in range(len(schedule)):
        curr = schedule[i]
        if j <= curr[0]:
            if output[hmp[(curr[0], curr[1])][0]] == None:
                output[hmp[(curr[0], curr[1])][0]] = "J"
            else:
                output[hmp[(curr[0], curr[1])][1]] = "J"
            j = curr[1]
        
        elif c <= curr[0]:
            if output[hmp[(curr[0], curr[1])][0]] == None:
                output[hmp[(curr[0], curr[1])][0]] = "C"
            else:
                output[hmp[(curr[0], curr[1])][1]] = "C"
            c = curr[1]
                       
        else: #j > curr[0] and c > curr[0]
            return "IMPOSSIBLE"
        
    return ''.join(output)

cnt = int(input())
for i in range(1, cnt + 1): # go through all the cases
    N = int(input())
    grid = []
    for j in range(N):
        grid.append(str(input()).split(" "))
    
    for r in range(len(grid)):
        for c in range(len(grid[0])):
            grid[r][c] = int(grid[r][c])
    res = f(grid)
    
    print("Case #{}: {}".format(i, res))  #format and output
    
    
    
    

def f(grid):
    output = [0,0,0]
    trace = 0
    for i in range(len(grid)):
        trace+=int(grid[i][i])
    output[0] = trace   
    for r in range(len(grid)):
        if len(set(grid[r]))!=len(grid[0]):
            output[1] +=1 
    
    for c in range(len(grid[0])):
        curr = []
        for r in range(len(grid)):
            curr.append(grid[r][c]) 
            
        if len(curr) != len(set(curr)):
            output[2]+=1
    output[0] = str(output[0])
    output[1] = str(output[1])
    output[2] = str(output[2])

    return ' '.join(output)


cnt = int(input())
for i in range(1, cnt + 1): # go through all the cases
    N = int(input())
    grid = []
    for j in range(N):
        grid.append(str(input()).split(" "))
    
    res = f(grid)
    
    print("Case #{}: {}".format(i, res))  #format and output



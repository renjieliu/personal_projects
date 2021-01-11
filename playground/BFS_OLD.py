graph =  {
    "A": ["B", "C"],
    "B": ["A","C","D"],
    "C": ["A","B","D","E"],
    "D": ["B","C","E", "F"],
    "E": ["C", "D"],
    "F": ["D"]
}

def BFS(graph, s):
    queue = [s] # this is the initial queue
    seen = [s] #this is to save all the nodes have been walked
    while (len(queue)!=0): # if the queue is not null, meaning, we can still find elements in the queue - now is s
        vertex = queue.pop() # take one out of the queue.
        nodes = graph[vertex] # and find the nodes connected to it
        for i in nodes: #for all the children, if it's not been see from the path yet, add it to the queue. after add it to the queue, take it out and find the nodes mapped to it.
            if i not in seen :
                queue.append(i)
                seen.append(i)
        print(vertex)

def DFS(graph, s):
    queue = [s] # this is the initial queue
    seen = [s] #this is to save all the nodes have been walked
    while (len(queue)!=0): # if the queue is not null, meaning, we can still find elements in the queue - now is s
        vertex = queue.pop(-1) # last pushed nodes, to see if there's any nodes connected to it not being used.
        nodes = graph[vertex] # and find the nodes connected to it
        for i in nodes: #for all the children, if it's not been see from the path yet, add it to the queue. after add it to the queue, take it out and find the nodes mapped to it.
            if i not in seen :
                queue.append(i)
                seen.append(i)

        print(vertex)



BFS(graph, "A")
print()
DFS(graph, "A")

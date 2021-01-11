graph =  {
    "A": ["B", "C"],
    "B": ["A","C","D"],
    "C": ["A","B","D","E"],
    "D": ["B","C","E", "F"],
    "E": ["C", "D"],
    "F": ["D"]
}

def BFS(graph, s):
    output = []
    output.append(s)
    seen = []
    seen.append(s)
    while len(output)!=0:
        node = output.pop(0)
        for i in graph[node]:
            if i not in seen:
                output.append(i)
                seen.append(i)

    return(seen)


print(BFS(graph, "E"))
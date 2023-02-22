graph =  {
    "A": ["B", "C"],
    "B": ["A","C","D"],
    "C": ["A","B","D","E"],
    "D": ["B","C","E", "F"],
    "E": ["C", "D"],
    "F": ["D"]
}

def DFS (graph, s):
    output =[]
    output.append(s)
    seen = []
    seen.append(s)

    while len(output) != 0:
        current = output.pop(-1)
        for node in graph[current]:
            if node not in seen:
                seen.append(node)
                output.append(node)

    return seen


print(DFS(graph, "F"))
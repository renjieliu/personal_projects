def f(arr): #["3 10","1 3 7"]
    total = int(arr[0].split(' ')[1])
    otherTickets = [int(_) for _ in arr[1].split(' ')]
    tickets = [_ for _ in range(1, total+1)]
    def win(c, myValue1, myValue2, otherTickets):
        myDiff = min(abs(myValue1 - c), abs(myValue2 - c))
        compare = float('inf')
        for v in otherTickets:
            compare = min(compare, abs(v-c))
        return 1 if myDiff < compare else 0
    prob = 0.0
    for a in tickets:
        for b in tickets:
            winCnt = 0
            for c in tickets:
                winCnt += win(c, a, b, otherTickets)
            prob = max(prob, winCnt / total)
    return prob

cases = int(input()) #total case counts
for i in range(1, cases+1):
    arr = []
    for j in range(2):
        arr.append(str(input()))
    res = f(arr)
    print(f"Case #{i}: {res}")  
    
    
    

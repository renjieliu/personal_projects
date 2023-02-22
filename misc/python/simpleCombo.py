def combo(input, n):
    if len(input) in [0,1,n]:
        return input

    else:
        output = []
        for i in range(0, len(input)): #iterate through the list
            current = input[i]
            rest = input[i + 1:] #the rest of the list
            for rec in combo(rest, n-1):
                output.append(current+rec)

    return output


print(combo(['a', 'b','c','d'],2))



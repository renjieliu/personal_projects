def combo(input, k):
    output = []
    for i in range(len(input)):
        if k == 1:
            output.append(input[i])
        for c in combo(input[i+1:], k-1):
            output.append(input[i] + c)
    return output

print(combo('abcde',3))





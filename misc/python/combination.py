def combo(n, k):
    if len(n) == k:
        return [n]

    else:
        output = []
        for i in range(len(n)):
            rest = n[:i] + n[i+1:]
            for x in combo(rest, k):
                output.append(x)

    return list(set(output))

print(combo('12345',3))



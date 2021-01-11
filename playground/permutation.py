def perm(n):
    if len(n) in [0,1]: #each time, this will only return one character.
        return n

    else:
        output = []
        for i in range(len(n)):
            curr = n[i]
            rest = n[:i] + n[i+1:]
            for x in perm(rest):
                output.append(curr+x)

    return output

print(perm('123'))




def dp_find(arr,curr, target):
    output = []
    if curr == 0:
        if arr[0] == target:
            return [arr[0]]

    elif arr[curr] ==target:
        return arr[curr]

    elif arr[curr]>target:
        return dp_find(arr, curr-1, target)

    else:
        A = dp_find(arr, curr-1, target) # not pick the current one
        B = dp_find(arr, curr-1, target - arr[curr]) #picking the current one, and find the remaining from the rest of the array
        if A:
            return output.append(A)
        if B:
            return output.append(B)

print(dp_find([3,34,4,12,5,2], 5, 9))
print(dp_find([3,34,4,12,5,2], 5, 10))
print(dp_find([3,34,4,12,5,2], 5, 11))
print(dp_find([3,34,4,12,5,2], 5, 12))
print(dp_find([3,34,4,12,5,2], 5, 13))
print(dp_find([3,34,4,12,5,2], 5, 34))



def bin_search(arr, n):
    s = 0
    e = len(arr) - 1
    pos = -1
    while s <= e:
        mid = (s + e) // 2
        if arr[mid] >= n:
            pos = mid
            e = mid - 1
        else:
            s = mid + 1
    if pos == -1:
        return -1
    else:
        return pos


def move(arr, pos, val):
    output = []
    if pos == -1:
        output = arr + [val]
    else:
        output = arr[:pos] + [val] + arr[pos:]
    return output


def binary_sort(arr):
    if arr== []:
        return arr
    output = [arr[0]]
    i = 1
    while i < len(arr):
        pos = bin_search(output, arr[i])
        output = move(output, pos, arr[i])
        i += 1
    return output


to_sort = binary_sort([5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10,5, 3, 5, 10, 0])

print(to_sort)








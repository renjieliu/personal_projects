def mergeSort(A,B): #A and B are sorted array
    output = []
    while A and B:
        output.append(A.pop(0) if A[0] <= B[0] else B.pop(0))
    output+=A if B ==[] else B
    return output


print(mergeSort([1,2,3,4,5], [2,4,6,7,8]))
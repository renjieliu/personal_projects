def addPeople(n):
    curr_sum = 0
    addPeople = 0
    for i in range(len(n)):

        if int(n[i]) != 0:
            if curr_sum> i:
                curr_sum += int(n[i])
            else:
                addPeople += i-curr_sum
                curr_sum += i-curr_sum
                curr_sum += int(n[i])
                #print(curr_sum, i, addPeople)
    #print(curr_sum, i, addPeople)
    return addPeople

print(addPeople("0000002"))
print(addPeople("4069616"))
print(addPeople("11111"))
print(addPeople("09"))
print(addPeople("110011"))
print(addPeople("1"))
print(addPeople("000000006000000400000201"))




f =open(r"C:\Users\lrjthinkpad\Desktop\A-large-practice.in")
w =open( r"C:\Users\lrjthinkpad\Desktop\result.txt", mode="w" )
f.readline()
i=0
for x in f:
    i+=1
    w.write("Case #{}: {}\n".format(i, addPeople(x.split(" ")[1].strip("\n"))))






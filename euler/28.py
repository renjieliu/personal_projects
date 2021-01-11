diag_1 = 0
n = 1001

for i in range(1,n+1,2):
	diag_1+= i**2
	
diag_2 = 0

for i in range(1,n,2):
	#print(diag_2)

	diag_2 += i**2 + (i+1)
	
	
diag_3 = 0
for i in range(1,n+1,2):
	diag_3 += (i-1)**2+1

	
diag_4 = 0
for i in range(1,n+1,2):
	diag_4 += i**2-(i-1)

	
print (diag_1)
print (diag_2)
print (diag_3)
print (diag_4)
	
print(diag_1+diag_2+diag_3+diag_4-2)